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
    @State var votedFor: [Player]?

    var body: some View {
        ZStack {

            if !gameOver {

                if playerIndex < game.players.count {
                    VStack {
                        Text(
                            "\(game.players[playerIndex].name) click who you think the Imposter is."
                        )
                        .padding(.top)

                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(game.players, id: \.self) { player in

                                    VStack {

                                        Text("\(player.name)'s Answers")
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(.gray)
                                            .onTapGesture {
                                                handleVote(player: player)
                                            }

                                        ForEach(player.answers, id: \.self) {
                                            answer in
                                            Text("Question: \(answer.question)")
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                            Text(answer.answers.first!)
                                                .padding(.bottom, 5)
                                        }
                                    }
                                    .background(Color.white.opacity(0.1))
                                }
                            }
                        }
                    }
                }
            }

            if gameOver {
                VStack {

                    Text("Player's Voted For:")
                        .font(.title)
                        .padding()

                    if let votedFor = votedFor {

                        if votedFor.count > 1 {
                            Text("Tie")
                                .font(.headline)
                                .foregroundStyle(.yellow)

                            ForEach(votedFor, id: \.self) { player in
                                HStack {
                                    Text("\(player.name)")
                                    Text("-")
                                    Text(
                                        player.isImposter
                                            ? "Imposter" : "Citizen"
                                    )
                                    .foregroundStyle(
                                        player.isImposter ? .red : .primary
                                    )
                                }
                            }
                        } else if !votedFor.isEmpty {
                            HStack {
                                Text("\(votedFor[0].name)")
                                Text("-")
                                Text(
                                    votedFor[0].isImposter
                                        ? "Imposter" : "Citizen"
                                )
                                .foregroundStyle(
                                    votedFor[0].isImposter ? .red : .primary
                                )
                            }
                        }
                    } else {
                        Text("Empty")
                    }

                    NavigationLink {
                        ContentView()
                    } label: {
                        Text("Play Again")
                            .padding()
                            .background(.green)
                            .cornerRadius(10)
                            .padding(.top, 20)
                            .foregroundStyle(.white)
                    }

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .onAppear {
                    votedFor = handleVotingOver()
                }
            }

        }
        .background(.black)
        .navigationBarBackButtonHidden(true)

    }

    func handleVote(player: Player) {
        votes.append(player)
        playerIndex += 1

        if playerIndex >= game.players.count {
            gameOver = true
        }
    }

    func handleVotingOver() -> [Player] {
        var mostVotedFor: [Player] = []
        var maxVotes = 0

        var voteCounts: [Int] = []

        for player in game.players {
            var count = 0
            // Loop through the VOTES array
            for vote in self.votes {
                if vote == player {
                    count += 1
                }
            }
            if count > maxVotes {
                maxVotes = count
            }
            voteCounts.append(count)
        }

        // Fixed Loop (No more infinite While loop)
        for (index, count) in voteCounts.enumerated() {
            if count == maxVotes {
                mostVotedFor.append(game.players[index])
            }
        }

        return mostVotedFor
    }
}

#Preview {
    ResultsView(game: Game(numberOfPlayers: 4, category: .Sports))
}
