//
//  Player.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Player: Identifiable, ObservableObject {
   @Published var name: String
   @Published var answers: [String] = []
   @Published var isImposter: Bool
   @Published var id: UUID
    
    init(name: String, isImposter: Bool) {
        self.name = name
        self.isImposter = isImposter
        id = UUID()
    }
    
    
    
}
