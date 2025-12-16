//
//  PlayerRowView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/16/25.
//

import SwiftUI

struct PlayerRowView: View {
    // This is the key: This view observes the specific Player object
    @ObservedObject var player: Player
    
    var body: some View {
        HStack {
            Text(player.name)
            Text("-")
            if let lastAnswer = player.answers.last {
                Text(lastAnswer)
                    // Animation is optional but looks nice
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    PlayerRowView(player: Player(name: "Greyson", isImposter: false))
}
