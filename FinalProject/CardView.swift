//
//  CardView.swift
//  FinalProject
//
//  Created by PARKER LETAK on 12/11/25.
//

import SwiftUI

struct CardView: View {
    
    @State var playerName: String
    @State var isImposter: Bool
    @State var word: String
    
    @State var flip = false
    
    var body: some View {
        
        Button{
            
            flip.toggle()
            
            
            
        } label: {
            //Text("\(playerName)")
            
            if !flip{
                Text("\(playerName)")
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                    )
                
                
            }
            
            else{
                
                if isImposter{
                    Text("Imposter")
                        .foregroundStyle(.red)
                        .font(.title)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                                .opacity(0.6)
                        )
                    
                }
                else{
                    Text("\(word)")
                        .foregroundStyle(.green)
                        .font(.title)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                                .opacity(0.6)
                        )
                    
                }
            }
            
        }
        
        
    }
}

#Preview {
    CardView(playerName: "parker", isImposter: false, word: "school")
}
