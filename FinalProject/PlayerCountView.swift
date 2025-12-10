//
//  PlayerCountView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/9/25.
//

import SwiftUI

struct PlayerCountView: View {
    
    @State var count: Int?
    @State var nextView = false
    
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
                
                VStack{
                    Stepper {
                        Text("Players: \(count!)")
                            .font(.title)
                    } onIncrement: {
                        count! += 1
                    } onDecrement: {
                        count! -= 1
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
                
                
                
                NavigationLink("", destination: PlayersView(), isActive: $nextView)
                
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
    PlayerCountView(count: 0)
}
