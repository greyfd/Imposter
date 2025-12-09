//
//  PlayerCountView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/9/25.
//

import SwiftUI

struct PlayerCountView: View {
    
    @State var count = 0
    
    var body: some View {
        
        VStack{
            Text("Players")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                        .foregroundStyle(.gray)
                )
            
           // Stepper("", value: $count)
            
            VStack{
                Stepper {
                    Text("Age: \(count)")
                        .font(.title)
                } onIncrement: {
                    count += 1
                } onDecrement: {
                    count -= 1
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
            
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(maxHeight: .infinity, alignment: .top)
                      .padding(.top, 150)
        .background(.black)
        .opacity(0.8)
        
        
        VStack{
            
            
            
            
        }
        
        
        
        
        
    }
}

#Preview {
    PlayerCountView()
}
