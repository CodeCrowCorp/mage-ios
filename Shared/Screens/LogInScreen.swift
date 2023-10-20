//
//  LogInScreen.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 12/10/23.
//

import SwiftUI

struct LogInScreen: View {
    
    var state: ButtonContentViewState = .regular
    @EnvironmentObject private var loginModel: LoginModel
    @State private var isLoading = false
    @State private var isLogin: Bool
    @State private var pushMentorContract = false

    init(isLogin: State<Bool>) {
        _isLogin = isLogin
    }
    
    var body: some View {
        BaseScreen() {
            ZStack {
                VStack(spacing: AppConfig.defaultSpacing) {
                    appLogo
                    loginOptionView
                }
                isLoading ? progressView : nil
            }.disabled(isLoading)
            setupNavigation
        }
        .onAppear{
            if UserDefaults.userId != "" && UserDefaults.token != "" {
                self.authUser()
            }
        }
        .onOpenURL { incomingURL in
            print("App was opened via URL: \(incomingURL)")
            if handleAuthURL(incomingURL) { self.authUser() }
        }
    }
    
    @ViewBuilder
    private var setupNavigation: some View {
        let screen = BrowseScreen()
            .environmentObject(ChannelModel())
        ProgrammaticallyNavigationLink(destination: screen,
                                       push: $pushMentorContract)
    }
    
    @ViewBuilder
    private var loginOptionView: some View {
        VStack(spacing: AppConfig.defaultSpacing) {
            discordButton
            gmailButton
            githubButton
        }
        .padding(.bottom, AppConfig.defaultSpacing * 2)
    }
    
    @ViewBuilder
    private var appLogo: some View {
        Spacer()
        ImageView(image: .logo)
            .frame(width: 150, height: 150)
        Spacer()
    }
    
    @ViewBuilder
    private var discordButton: some View {
        ButtonView(title: "Login With Discord",
                   leftIcon: .discord,
                   color: .mage_blue,
                   textColor: .mage_white,
                   state: state,
                   height: AppConfig.minButtonHeight,
                   cornerRadius: 12) {
            print("Tap on Discord")
            self.loginWithDiscord()
        }
    }
    
    @ViewBuilder
    private var gmailButton: some View {
        ButtonView(title: "Login With Google",
                   leftIcon: .gmail,
                   color: .mage_gray,
                   textColor: .mage_black,
                   type: .border,
                   state: state,
                   height: AppConfig.minButtonHeight,
                   cornerRadius: 12) {
            print("Tap on Google")
            self.loginWithGmail()
        }
    }
    
    @ViewBuilder
    private var githubButton: some View {
        ButtonView(title: "Login With Github",
                   leftIcon: .github,
                   color: .mage_black,
                   textColor: .mage_white,
                   state: state,
                   height: AppConfig.minButtonHeight,
        cornerRadius: 12) {
            print("Tap on Github")
            self.loginWithGithub()
        }
    }
    
    func authUser() {
        Task {
            do {
                self.isLoading.toggle()
                try await loginModel.authUser()
                print("freshJwt: ", loginModel.auth?.freshJwt ?? "")
                self.isLoading.toggle()
                self.pushMentorContract.toggle()
            } catch {
                self.isLoading.toggle()
                print(error.localizedDescription)
            }
        }
    }
    
    func loginWithDiscord() {
        Task {
            do {
                self.isLoading.toggle()
                try await loginModel.fetchLogin(type: .discord)
                if let openURL = URL(string: loginModel.login?.loginUrl ?? "") {
                    self.isLoading.toggle()
                    await UIApplication.shared.open(openURL)
                }
            } catch {
                self.isLoading.toggle()
                print(error.localizedDescription)
            }
        }
    }
    
    func loginWithGmail() {
        Task {
            do {
                self.isLoading.toggle()
                try await loginModel.fetchLogin(type: .google)
                if let openURL = URL(string: loginModel.login?.loginUrl ?? "") {
                    self.isLoading.toggle()
                    await UIApplication.shared.open(openURL)
                }
            } catch {
                self.isLoading.toggle()
                print(error.localizedDescription)
            }
        }
    }
    
    func loginWithGithub() {
        Task {
            do {
                self.isLoading.toggle()
                try await loginModel.fetchLogin(type: .github)
                if let openURL = URL(string: loginModel.login?.loginUrl ?? "") {
                    self.isLoading.toggle()
                    await UIApplication.shared.open(openURL)
                }
            } catch {
                self.isLoading.toggle()
                print(error.localizedDescription)
            }
        }
    }
    
}

struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen(isLogin: .init(initialValue: false))
    }
}

