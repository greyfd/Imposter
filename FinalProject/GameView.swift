import SwiftUI
struct GameView: View {
 
    @StateObject var game: Game
    @StateObject var question: Question
    
    @State var peopleAnswered: Int = 0
    @State var showAnswers = false
    @State var endGame = false


    var body: some View {
        NavigationStack {
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
                        PlayerRowView(player: player)
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
                
                VStack {
                    Spacer()
                    Text("Game Over")
                    Spacer()
                    NavigationLink {
                        ResultsView()
                    } label: {
                        AnswerButton(answer: "Go to Results") {
                            
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .opacity(endGame ? 100 : 0)
                
            }
            .background(getCurrentPlayerImposterStatus() ? .red : .white)
            .onAppear() {
                
                
            }
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
        
        game.objectWillChange.send()

        let player = game.getPlayer(index: peopleAnswered)
        player.answers.append(selectedAnswer)
        print("\(player.name) answered: \(selectedAnswer)")
        
        if peopleAnswered + 1 >= game.players.count {
//round over
            peopleAnswered = 0
            
            guard let question = game.nextQuestion() else {
                endGame = true
                return
            }
            
            question.setSelf(question: question)
            print(question.question)
            showAnswers = true
            
        } else {
            peopleAnswered += 1
        }
    }
    
}

#Preview {

    GameView(game: Game(numberOfPlayers: 4, category: .Sports), question: Game(numberOfPlayers: 4, category: .Sports).nextQuestion()!)

}


