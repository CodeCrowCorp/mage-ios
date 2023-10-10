//
//  ChannelScreen.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import SwiftUI

struct ChannelScreen: View {
    
    let channel: Channel
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var channelModel: ChannelModel
    
    var body: some View {
        List(channelModel.channels, id: \._id) { channel in
            NavigationLink(value: channel) {
                ChannelCellView(channel: channel)
            }
        }
    }
}

struct ChannelScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChannelScreen(channel: Channel(_id: "01234", title: "Test Channel", description: "Test channel description", userDetails: User(_id: "1234", username: "testgagansuie", displayName: "Test Gagan Suie", avatar: "img" )))
                .environmentObject(ChannelModel())
        }
    }
}
