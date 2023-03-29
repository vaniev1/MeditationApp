//
//  MeditationView.swift
//  MeditationApp
//
//  Created by mak on 29.03.2023.
//

import SwiftUI

struct MeditationView: View {
    @State private var showPlayer = false
    @StateObject var meditationVM : MeditationViewModel
    
    var body: some View {
        VStack {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24){
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Музыка")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "С")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text(meditationVM.meditation.title)
                        .font(.title)
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Слушать", systemImage: "play.fill")
                    }

                    
                    Text(meditationVM.meditation.description)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVm: meditationVM)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        let meditationVM = MeditationViewModel(meditation: Meditation.data)
        
        MeditationView(meditationVM: meditationVM)
    }
}
