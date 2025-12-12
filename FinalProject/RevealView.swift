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
    
    
    var body: some View {
        
        VStack{
            
            let columns = [GridItem(), GridItem()]
            
            LazyVGrid(columns: columns) {
                ForEach(players){ p in
                        CardView(playerName: p.name, isImposter: p.isImposter, word: "word")
                }
            
            }
                
                
                
                
            
            
        }    //vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(0.8)
        
    }
    
    
}

#Preview {
    RevealView(players: [Player(name: "Greyson", isImposter: false), Player(name: "Parker", isImposter: false), Player(name: "Caden", isImposter: false), Player(name: "Elijah", isImposter: true)], count: 3, cat: "sports")
}
