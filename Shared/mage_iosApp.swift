//
//  mage_iosApp.swift
//  Shared
//
//  Created by Gagan Suie on 7/14/23.
//

import SwiftUI

@main
struct mage_iosApp: App {
    
    @StateObject private var channelModel = ChannelModel()
    
    var body: some Scene {
        WindowGroup {
            BrowseScreen().environmentObject(channelModel)
        }
    }
}
