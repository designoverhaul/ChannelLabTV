//
//  Channel_Lab_TVApp.swift
//  Channel Lab TV
//
//  Created by Aaron Heine on 11/22/24.
//

import SwiftUI
import FirebaseCore

@main
struct Channel_Lab_TVApp: App {
    init() {
        FirebaseApp.configure()
        print("Firebase configured") // Debug log
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()  // Let's temporarily go back to ContentView
        }
    }
}
