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
    
    func getFavoriteData() async throws {
        
        var header: [String: String] = [:]
        header["token"] = UserDefaults.token
        header["userId"] = UserDefaults.userId
        header["User-Agent"] = "Mage-Mobile"
        
        let param: [String: String] = [:]
        header["deviceToken"] = UserDefaults.token
        
        let paramData = try PropertyListSerialization.data(fromPropertyList: param, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
        
        print(paramData)
        channels = try await client.load(Resource(url: URL.favorites, headers: header, method: .patch(paramData)))
        print(channels)
    }
}
