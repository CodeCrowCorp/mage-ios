//
//  MageApp.swift
//  mage-ios
//
//  Created by Kushkumar Katira on 12/10/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
