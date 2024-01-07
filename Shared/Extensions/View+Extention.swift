//
//  View+Extention.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 13/10/23.
//

import Foundation
import SwiftUI

extension View {

    @ViewBuilder
    var progressView: some View {
        ZStack {
            Rectangle()
                .fill(Color.mage_white)
                .frame(width: 100, height: 100)
                .cornerRadius(14)
                .shadow(color: .mage_gray.opacity(0.5), radius: 5)

            VStack(spacing: AppConfig.emptySpacing) {
                ProgressView()
                    .tint(.purple)
                    .controlSize(.large)
                Spacer()
                Text("Loading...")
                    .font(AppFonts.font(size: 14, style: .semiBold))
                    .foregroundColor(.mage_black)
            }
            .frame(width: 70, height: 70)
        }
    }
    
    func handleAuthURL(_ url: URL) -> Bool {
        guard url.scheme == "magemobile" else {
            return false
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL")
            return false
        }
        
        guard let userToken = components.queryItems?.first(where: { $0.name == "token" })?.value else {
            print("token not found")
            return false
        }
        
        guard let userId = components.queryItems?.first(where: { $0.name == "userId" })?.value else {
            print("userId not found")
            return false
        }
        
        print("userToken: ", userToken)
        print("userId: ", userId)
        
        UserDefaults.token = userToken
        UserDefaults.userId = userId
        return true
    }
    
}
