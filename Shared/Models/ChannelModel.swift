//
//  ChannelModel.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import Foundation

@MainActor
class ChannelModel: ObservableObject {
    
    let client = HttpClient()
    @Published var channels: [Channel] = []
    
    func fetchChannels() async throws {
        channels = try await client.load(Resource(url: URL.allChannels))
        print(channels)
    }
}
