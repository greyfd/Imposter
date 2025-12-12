//
//  Player.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Player: Identifiable {
    var name: String
    var answers: [String] = []
    var isImposter: Bool
    
    init(name: String, isImposter: Bool) {
        self.name = name
        self.isImposter = isImposter
    }
    
    
    
}
