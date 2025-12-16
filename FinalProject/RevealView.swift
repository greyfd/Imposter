//
//  RevealView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/12/25.
//

import SwiftUI

struct RevealView: View {
    
    @State var players: [Player]
    
    @State var count: Int
    
    @State var cat: String
    
    @State var playersReady = 0
    
    //@State var themeColor: Color
    
    @State var nextView = false
    
    
    var body: some View {
        
        NavigationStack{
        
        VStack{
            
            Text("Tap to Reveal Role")
                .font(.largeTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                )
            
            Text("Don't Let Anyone Else See Your Role!")
                .font(.subheadline)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                )
            
            let columns = [GridItem(), GridItem()]
            
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(players){ p in
                    CardView(playerName: p.name, isImposter: p.isImposter, word: "word")
                }
                
            }
            .padding()
            
            
            Button {
                
                playersReady += 1
                
                if playersReady == players.count {
                    
                    nextView = true
                    
                }
                
            } label: {
                Text("Ready Up")
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                    )
            }
            
            Text("Players Ready: \(playersReady)/\(players.count)")
                .foregroundStyle(.white)
                .font(.subheadline)
            
            
            NavigationLink("", destination: GameView(players: players, count: count, cat: cat), isActive: $nextView)
               // .navigationBarBackButtonHidden(true)
            
            
        }    //vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(0.8)
        
    }
        
    }
    
    
}

#Preview {
    RevealView(players: [Player(name: "Greyson", isImposter: false), Player(name: "Parker", isImposter: false), Player(name: "Caden", isImposter: false), Player(name: "Elijah", isImposter: false)], count: 3, cat: "sports")
}
