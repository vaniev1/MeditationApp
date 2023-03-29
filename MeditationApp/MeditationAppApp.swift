//
//  MeditationAppApp.swift
//  MeditationApp
//
//  Created by mak on 24.03.2023.
//

import SwiftUI

@main
struct MeditationAppApp: App {
    @StateObject var auidioManager = AudioManager()
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
        
        UITabBar.appearance().backgroundColor = UIColor(red: 24/255, green: 23/255, blue: 22/255, alpha: 1)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auidioManager)
        }
    }
}
