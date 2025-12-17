//
//  PlayerRowView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/16/25.
//

import SwiftUI

struct PlayerRowView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        HStack {
            Text(player.name)
            Text("-")
            if let lastAnswer = player.answers.last?.answers.first {
                Text(lastAnswer)
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    PlayerRowView(player: Player(name: "Greyson", isImposter: false))
}
