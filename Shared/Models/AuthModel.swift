//
//  AuthModel.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 13/10/23.
//

import Foundation

struct AuthData: Codable, Hashable {
    
    let freshJwt: String?
    let user: AuthUserData?
    
}

struct AuthUserData: Codable, Hashable {
    let _id: String?
    let avatar: String?
    let createdAt: Int?
    let displayName: String?
    let isOnline: Bool?
    let planDetails: PlanDetails?
    let providerId: String?
    let providerType: String?
    let username: String?
}

struct PlanDetails: Codable, Hashable {
    
    let _id: String?
    let user: String?
    let planTier: Int?
    let createdAt: Int?
    let updatedAt: Int?
    
}
