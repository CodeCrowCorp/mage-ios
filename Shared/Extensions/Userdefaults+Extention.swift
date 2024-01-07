//
//  Userdefaults+Extention.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 13/10/23.
//

import Foundation

extension UserDefaults {
    
    static var token: String {
        get {
            self.standard.string(forKey: "user_token") ?? ""
        } set {
            self.standard.set(newValue, forKey: "user_token")
        }
    }
    
    static var userId: String {
        get {
            self.standard.string(forKey: "user_id") ?? ""
        } set {
            self.standard.set(newValue, forKey: "user_id")
        }
    }
    
}
