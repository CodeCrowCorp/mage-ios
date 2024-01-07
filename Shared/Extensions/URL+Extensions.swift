//
//  URL+Extensions.swift
//  mage-ios
//
//  Created by Gagan Suie on 10/9/23.
//

import Foundation

extension URL {
    
    static var development: URL {
        URL(string: "https://dev.api.mage.stream")!
    }
    
    static var production: URL {
        URL(string: "https://api.mage.stream")!
    }
    
    static var `default`: URL {
        #if DEBUG
            return development
        #else
            return production
        #endif
    }
    
    static var allChannels: URL {
        URL(string: "/channels", relativeTo: Self.default)!
    }
  
    static var googleAuth: URL {
        URL(string: "/auth/google", relativeTo: Self.default)!
    }
    
    static var githubAuth: URL {
        URL(string: "/auth/github", relativeTo: Self.default)!
    }
    
    static var discordAuth: URL {
        URL(string: "/auth/discord", relativeTo: Self.default)!
    }
    
    static var auth: URL {
        URL(string: "/auth/me", relativeTo: Self.default)!
    }
    
    static var favorites: URL {
        URL(string: "/favorites", relativeTo: Self.default)!
    }
  
    //static func productsByCategory(_ categoryId: Int) -> URL {
        //return URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.default)!
    //}
}
