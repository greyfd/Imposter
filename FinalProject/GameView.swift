import SwiftUI
struct GameView: View {
 
    @StateObject var game: Game
    @StateObject var question: Question
    
    @State var peopleAnswered: Int = 0
    @State var showAnswers = false
    
    init(players: [Player], count: Int, cat: String) {
        let newGame = Game(numberOfPlayers: count, category: .Sports)
        newGame.setPlayers(players: players)
        newGame.initGame()
        newGame.nextQuestion()
        _question = StateObject(wrappedValue: newGame.currentQuestion ?? Question(question: "Error", answers: []))
        _game = StateObject(wrappedValue: newGame)
    }

    var body: some View {
        ZStack {
            
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
            
            VStack {
                ForEach(game.players) { player in
                    Spacer()
                    HStack {
                        Text(player.name)
                        Text("-")
                        Text(player.answers.last ?? "No Answers")
                    }
                    Spacer()
                    
                }
                Spacer()
                Button("Next Question", systemImage: "paperplane.fill") {
                    showAnswers.toggle()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .opacity(showAnswers ? 100 : 0)
                        
        }
        .background(getCurrentPlayerImposterStatus() ? .red : .white)
        .onAppear() {

            
        }
        .navigationBarBackButtonHidden(true)
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
            print(newQuestion.question)
            peopleAnswered = 0
            showAnswers = true
        }
    }
    
}

#Preview {

    GameView(players: [Player(name: "Greyson", isImposter: false), Player(name: "Parker", isImposter: false), Player(name: "Caden", isImposter: false)], count: 3, cat: "sports")

}


