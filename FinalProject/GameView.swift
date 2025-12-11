import SwiftUI

struct GameView: View {
 
    @StateObject var game: Game
    @StateObject var question: Question = Question(question: "Loading...", answers: [])
    
    @State var peopleAnswered: Int = 0
    
    init(players: [Player], count: Int, cat: String) {
        let newGame = Game(numberOfPlayers: count, category: .Sports)
        newGame.setPlayers(players: players)
        newGame.initGame()
        _game = StateObject(wrappedValue: newGame)
    }

    var body: some View {
        VStack {
            Text("\(game.players[peopleAnswered].name)'s Turn")
            
            Spacer()
            
          
            
            Spacer()
            
            if let activeQuestion = game.currentQuestion {
                Text(activeQuestion.question)
                VStack {
                    ForEach(activeQuestion.answers, id: \.self) { answerText in
                        AnswerButton(answer: answerText) {
                            answerQuestion(selectedAnswer: answerText)
                        }
                    }
                }
            }
            
            
            Spacer()
        }
        .background(getCurrentPlayerImposterStatus() ? .red : .white)
        .onAppear() {
          let firstQ = game.nextQuestion()
        question.setSelf(question: firstQ)
            
        }
    }
    
    func getCurrentPlayerImposterStatus() -> Bool {
        if peopleAnswered < game.players.count {
            return game.players[peopleAnswered].isImposter
        }
        return false
    }
    
    func answerQuestion(selectedAnswer: String) {
        guard peopleAnswered < game.players.count else { return }

        let player = game.getPlayer(index: peopleAnswered)
        
        player.answers.append(selectedAnswer)
        
        print("\(player.name) answered: \(selectedAnswer)")
        
        peopleAnswered += 1
        
        if peopleAnswered >= game.players.count {
            let newQuestion = game.nextQuestion()
            
            question.setSelf(question: newQuestion)
            
            peopleAnswered = 0
        }
    }
    
}

#Preview {

    GameView(players: [Player(name: "Greyson", isImposter: false), Player(name: "Parker", isImposter: false), Player(name: "Caden", isImposter: false)], count: 3, cat: "sports")

}


