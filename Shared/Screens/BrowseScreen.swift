//
//  BrowseScreen.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import SwiftUI

struct BrowseScreen: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var channelModel: ChannelModel
    @State private var errorMessage = ""
    @State private var isLoading = false

    var body: some View {
        BaseScreen() {
            ZStack {
                VStack(spacing: AppConfig.defaultMinSpacing) {
                    listData
                    Text(errorMessage)
                        .font(AppFonts.font(size: 16, style: .bold))
                    Spacer()
                }
                isLoading ? progressView : nil
            }.disabled(isLoading)
        }.onAppear {
            self.getChannelList()
        }
    }
    
    @ViewBuilder
    private var listData: some View {
        List(channelModel.channels, id: \._id) { channel in
            NavigationLink(destination: ChannelScreen(channel: channel)) {
                ChannelCellView(channel: channel)
            }
        }.listStyle(.plain)
            .background(Color.background)
    }
    
    private func getChannelList() {
        Task {
            do {
                self.isLoading.toggle()
                try await channelModel.fetchChannels()
                try await channelModel.getFavoriteData()
                self.isLoading.toggle()
            } catch {
                self.isLoading.toggle()
                errorMessage = (error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
}

struct BrowseScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BrowseScreen()
                .environmentObject(ChannelModel())
        }
    }
}
