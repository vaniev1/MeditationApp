//
//  ContentView.swift
//  MeditationApp
//
//  Created by mak on 24.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedFilter: FilterOptions = .nature
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    MainView(selectedOption: $selectedFilter)
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
                .navigationBarTitleDisplayMode(.inline)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}

