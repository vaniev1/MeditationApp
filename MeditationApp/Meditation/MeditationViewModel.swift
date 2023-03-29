//
//  MeditationViewModel.swift
//  MeditationApp
//
//  Created by mak on 29.03.2023.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title : String
    let description : String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "Медитативная расслабляющая музыка", description: "Очистите ваши мысли и насладитесь звуками костра под спокойную музыку ", duration: 60, track: "sound1", image: "fireLevel")
}
