//
//  Channel.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import Foundation

struct Channel: Codable, Hashable {
    var _id: String
    let title: String
    let description: String
    let userDetails: User
}

extension Channel {
    static var preview: Channel {
        Channel(_id: "01234", title: "Test channel", description: "Test channel description", userDetails: User(_id: "1234", username: "testgagansuie", displayName: "Test Gagan Suie", avatar: "img"))
    }
}
