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

        Button {

            withAnimation(.easeInOut(duration: 0.4)) {
                flip.toggle()
            }

        } label: {
            //Text("\(playerName)")

            ZStack {

           
                Text(playerName)
                    .foregroundStyle(.white)
                    .font(.title)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                    )
                    .opacity(flip ? 0 : 1)
                    .rotation3DEffect(.degrees(flip ? 180 : 0),axis: (1, 0, 0))

              
                VStack {
                    if isImposter {
                        Text("Imposter")
                            .foregroundStyle(.red)
                    } else {
                        Text(word)
                            .foregroundStyle(.green)
                    }
                }
                .font(.title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                )
                .opacity(flip ? 1 : 0)
                .rotation3DEffect(.degrees(flip ? 0 : -180),axis: (1, 0, 0))
                
                
            }
        }
    }

}

#Preview {
    CardView(playerName: "parker", isImposter: false, word: "school")
}
