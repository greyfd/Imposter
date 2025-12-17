//
//  Player.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Player: Identifiable, ObservableObject, Hashable, Equatable {
   @Published var name: String
   @Published var answers: [Question] = []
   @Published var isImposter: Bool
   @Published var id: UUID
    
    init(name: String, isImposter: Bool) {
        self.name = name
        self.isImposter = isImposter
        id = UUID()
    }
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id 
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    
    
    
}
