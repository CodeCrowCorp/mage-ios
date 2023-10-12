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

    var body: some View {
        List(channelModel.channels, id: \._id) { channel in
            NavigationLink(value: channel) {
                ChannelCellView(channel: channel)
            }
        }
        .navigationDestination(for: Channel.self, destination: { channel in
            ChannelScreen(channel: channel)
        })
        .listStyle(.plain)
        .task {
            do {
                try await channelModel.fetchChannels()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        Text(errorMessage)
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
