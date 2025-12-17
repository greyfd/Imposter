//
//  PlayerCountView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/9/25.
//

import SwiftUI

struct PlayerCountView: View {
    
    @State var count = 3
    
    @State var nextView = false
    
    //@State var themeColor: Color
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                Spacer()
                Text("Players")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 50)
                            .foregroundStyle(.gray)
                    )
                
                // Stepper("", value: $count)
                Spacer()
                
                Text("Min 3 Players")
                    .foregroundStyle(.gray)
                    .font(.caption)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width: 85, height: 17)
                    )
                
                VStack{
                    Stepper {
                        Text("Players: \(count)")
                            .font(.title)
                    } onIncrement: {
                        count += 1
                    } onDecrement: {
                        if count > 3 {count -= 1}
                    }
                    .foregroundStyle(.white)
                }
                .background(
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 380, height: 50)
                        .foregroundStyle(.gray)
                        .opacity(0.6)
                )
                .padding()
                
                Spacer()
                
                Button {
                    
                    nextView = true
                    
                    //save numPlayers
                    
                } label: {
                    Text("Submit")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width: 380, height: 50)
                                .foregroundStyle(.blue)
                                .opacity(0.6)
                        )
                        .padding()
                }
                
                Spacer()
                
                
                
                NavigationLink("", destination: PlayersView(count: count), isActive: $nextView)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // .frame(maxHeight: .infinity, alignment: .top)
            //.padding(.top, 150)
            .background(.black)
            .opacity(0.8)
            
            
            
            
            
            
            
        }    //nav stack
    }
}

#Preview {
    PlayerCountView()
}
