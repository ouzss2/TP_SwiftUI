//
//  MyAppApp.swift
//  MyApp
//
//  Created by Tekup-mac-1 on 11/10/2024.
//

import SwiftUI
import Firebase

@main
struct MyAppApp: App {
    init() {
            FirebaseApp.configure()
        }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
