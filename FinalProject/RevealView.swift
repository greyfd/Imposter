import SwiftUI

struct RevealView: View {
    
    @StateObject var game: Game

    @State var playersReady = 0
    
    //@State var themeColor: Color
    
    @State var nextView = false
    
    init(players: [Player], count: Int, cat: String) {
        let newGame = Game(numberOfPlayers: count, category: .Sports)
        
        newGame.setPlayers(players: players)
        
        newGame.initGame()
        
        _game = StateObject(wrappedValue: newGame)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Tap to Reveal Role")
                    .font(.largeTitle)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray))
                
                Text("Don't Let Anyone Else See Your Role!")
                    .font(.subheadline)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray))
                
                let columns = [GridItem(), GridItem()]
                
                LazyVGrid(columns: columns, spacing: 50) {
                   
                    ForEach(game.players) { p in
                        CardView(playerName: p.name, isImposter: p.isImposter, word: "Pizza") //add getting from game class
                    }
                }
                .padding()
                
                Button {
                    playersReady += 1
                    if playersReady >= game.players.count {
                        nextView = true
                    }
                } label: {
                    Text("Ready Up")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.blue))
                }
                
                Text("Players Ready: \(playersReady)/\(game.players.count)")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                
                NavigationLink("", destination: GameView(game: game, question: game.nextQuestion()!), isActive: $nextView)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.8))
        }
    }
}

#Preview {
    RevealView(players: [Player(name: "Greyson", isImposter: false), Player(name: "Parker", isImposter: false), Player(name: "Caden", isImposter: false)], count: 3, cat: "Sports")
}
