//
//  ResultsView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/16/25.
//

import SwiftUI

struct ResultsView: View {
    var game: Game
    @State var playerIndex = 0
    @State var votes: [Player] = []
    @State var gameOver = false
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(game.players[playerIndex].name) click who you think the Imposter is.")
                
                ForEach(game.players, id: \.self) {player in
                    
                    VStack {
                        
                        Text("\(player.name)'s Answers")
                            .fontWeight(.bold)
                            .padding()
                            .background(.gray)
                            .onTapGesture {
                               handleVote(player: player)
                            }
                        
                        
                        ForEach(player.answers, id: \.self) { answer in
                            Text("Question: \(answer.question)")
                            Text(answer.answers.first!)
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                Text("Game Over")
                Spacer()
        
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .opacity(gameOver ? 100 : 0)
            .onChange(of: gameOver) { oldValue, newValue in
                
            }
            
        }
        .navigationBarBackButtonHidden(true)

    }
    
    func handleVote(player: Player) {
        votes.append(player)
        if (playerIndex + 1 < game.players.count) {
            playerIndex += 1
        } else {
            gameOver = true
            return
        }
        
        guard playerIndex < game.players.count else {
            gameOver = true
            return
        }
        
        
    }
    
    func handleVotingOver() {
        
    }
}

#Preview {
    ResultsView(game: Game(numberOfPlayers: 4, category: .Sports))
}
