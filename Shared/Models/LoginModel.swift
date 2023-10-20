//
//  LoginModel.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 13/10/23.
//

import Foundation

struct LoginData: Codable, Hashable {
    let message: String?
    let loginUrl: String?
}

public enum AuthType {
    case google
    case github
    case discord
}

@MainActor
class LoginModel: ObservableObject {
    
    let client = HttpClient()
    @Published var login: LoginData?
    @Published var auth: AuthData?
    
    func fetchLogin(type: AuthType) async throws {
        switch type {
        case .google:
            login = try await client.load(Resource(url: URL.googleAuth))
        case .github:
            login = try await client.load(Resource(url: URL.githubAuth))
        case .discord:
            login = try await client.load(Resource(url: URL.discordAuth))
        }
        print(login)
    }
    
    func authUser() async throws {
        
        var header: [String: String] = [:]
        header["token"] = UserDefaults.token
        header["userId"] = UserDefaults.userId
        header["User-Agent"] = "Mage-Mobile"
        
        auth = try await client.load(Resource(url: URL.auth, headers: header, method: .get([])))
    }
}
