//
//  PlayersView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/10/25.
//

import SwiftUI

struct PlayersView: View {
    
    @State var count: Int
    
    @State var players: [Player] = []
    
    @State var nextView = false
    
    @State var name = ""
    
    @State var firstTime = 0
    
    //@State var themeColor: Color
    
    var body: some View {
        VStack{
            Text("Enter Names")
                .font(.title)
                .foregroundStyle(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.gray)
                )
            List{
                
                ForEach(0..<players.count, id: \.self){ i in
                    
                    TextField("Player \(i+1) Name", text: $players[i].name)
                    
                    
                }
                
                
            }
            .frame(width: 350, height: 500)
            .onAppear{
                if firstTime == 0{
                    for _ in 0..<count{
                        players.append(Player(name: "", isImposter: false))
                    }
                    firstTime += 1
                }
            }
            
            Button {
                nextView = true
//                for player in players {
//                    print(player.name)
//                }
                
                
                
            } label: {
                Text("Submit")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundStyle(.blue)
                    )
            }

            
            NavigationLink("", destination: CategoryView(count: count, players: players), isActive: $nextView)
            
            
        }      //vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .opacity(0.8)
    }
}

#Preview {
    //PlayersView(count: .constant(0))
}
