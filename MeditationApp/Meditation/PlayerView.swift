//
//  PlayerView.swift
//  MeditationApp
//
//  Created by mak on 29.03.2023.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var audioManager : AudioManager
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    var meditationVm : MeditationViewModel
    var isPreview: Bool = false
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            Image(meditationVm.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            
            VStack(spacing: 30) {
                
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }

                    Spacer()
                    
                }
                
                Text(meditationVm.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let player = audioManager.player {
                    
                    VStack(spacing: 5) {
                        //                    Устанавливается длина песни
                        Slider(value: $value, in: 0...player.duration) { editing in
                            if !editing {
                                isEditing = editing
                                player.currentTime = value
                            }
                        }
                            .accentColor(.white)
                        
                        HStack {
                            
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                            
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    HStack {
                        let color : Color = audioManager.isLooping ? .teal : .white
                        PlaybackControllButton(systemName: "repeat", color: color) {
                            audioManager.toggleLoop()
                        }
                        
                        Spacer()
                        
                        PlaybackControllButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        
                        Spacer()
                        
                        PlaybackControllButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                            audioManager.playPause()
                        }
                        
                        Spacer()
                        
                        PlaybackControllButton(systemName: "goforward.10") {
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        PlaybackControllButton(systemName: "stop.fill") {
                            audioManager.stop()
                        }
                    }
                }
            }
            .padding(20)
        }
        .onAppear{
            audioManager.startPlayer(track: meditationVm.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let meditationVM = MeditationViewModel(meditation: Meditation.data)
        PlayerView(meditationVm: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}
