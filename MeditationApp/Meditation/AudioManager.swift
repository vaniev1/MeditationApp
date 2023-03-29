//
//  AudioManager.swift
//  MeditationApp
//
//  Created by mak on 29.03.2023.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
//    static let shared = AudioManager()
    
    var player : AVAudioPlayer?
    @Published var isPlaying: Bool = false
    @Published var isLooping: Bool = false
    
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            
            print("Resource not found")
            return
            
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
            
            
        } catch {
            print(error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0 
    }
}
