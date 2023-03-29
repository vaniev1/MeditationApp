//
//  ProfileView.swift
//  MeditationApp
//
//  Created by mak on 24.03.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("Profile")
                }
            }
            .background{
                Color(red: 24/255, green: 23/255, blue: 22/255)
                    .ignoresSafeArea(edges: .top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
