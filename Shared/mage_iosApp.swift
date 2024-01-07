//
//  mage_iosApp.swift
//  Shared
//
//  Created by Gagan Suie on 7/14/23.
//

import SwiftUI

@main
struct mage_iosApp: App {
    
    @State var isFromLogin = false
    
    var body: some Scene {
        WindowGroup {
            LogInScreen(isLogin: _isFromLogin)
                .environmentObject(LoginModel())
        }
    }
}
