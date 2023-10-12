//
//  User.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import Foundation

struct User: Codable, Hashable {
    var _id: String
    let username: String
    let displayName: String
    let avatar: String
}

extension User {
    static var preview: User {
        User(_id: "01234", username: "testgagansuie", displayName: "Gagan Suie", avatar: "img")
    }
}
