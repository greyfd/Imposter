//
//  Game.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Game: ObservableObject {
    
     enum category {
         case Sports
         case Geography
         case VideoGames
    }
    @Published var currentQuestion: Question?
    var numberOfPlayers: Int
    var players: [Player] = []
    var imposter: Player
    var category: category
    var questionSet: [Question] = [
        Question(question: "What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"]),
        Question(question: "2What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"]),
        Question(question: "3What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"]),
        Question(question: "4What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"]),
        Question(question: "5What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"]),
        Question(question: "6What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"])

    ]
    var questionIndex = 0
    
    
    init(numberOfPlayers: Int, category: category) {
        
        self.numberOfPlayers = numberOfPlayers
        self.category = category
        for i in 0..<numberOfPlayers {
            players.append(Player(name: "Player \(i + 1)", isImposter: false))
        }
        
        let random = Int.random(in: 0..<numberOfPlayers)
        
        let impasta = players[random]
        impasta.isImposter = true
        imposter = impasta
            
    }
    
    func getPlayer(index: Int) -> Player {
        return players[index];
    }
    
    func answerQuestion(player: Player, answer: String) -> Void {
        player.answers.append(answer)
    }
    
    func nextQuestion() -> Question {
        currentQuestion = questionSet[questionIndex + 1]
        return questionSet[questionIndex + 1]
    }
    
    func setSelf(game: Game) {
        self.players = game.players
        self.category = game.category
        self.numberOfPlayers = game.numberOfPlayers
        self.imposter = game.imposter
    }
    
    func setPlayers(players: [Player]) {
        self.players = players
    }
    
    func initGame() {
        let random = Int.random(in: 0..<numberOfPlayers)
        
        let impasta = players[random]
        impasta.isImposter = true
        imposter = impasta
    }
    
    
    
     
}
