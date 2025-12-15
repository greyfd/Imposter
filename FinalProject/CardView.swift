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
    @State var seen = false

    @State var flip = false
    @State var locked = false

    var body: some View {

        Button {

            if locked {
                return
            } else {

                withAnimation(.easeInOut(duration: 0.4)) {
                    flip.toggle()
                }

                if flip == false {
                    locked = true
                }

            }

        } label: {
            //Text("\(playerName)")

            ZStack {

                Text(playerName)
                    .foregroundStyle(.white)
                    .font(.title)
                    .opacity(locked ? 0.6 : 1)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(locked ? .gray : .blue)
                            .opacity(locked ? 0.6 : 1)
                    )
                    .opacity(flip ? 0 : 1)
                    .rotation3DEffect(.degrees(flip ? 180 : 0), axis: (1, 0, 0))

                // if seen == false{
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
                .rotation3DEffect(.degrees(flip ? 0 : -180), axis: (1, 0, 0))
            }
            //.frame(width: 150, height: 200)
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundStyle(locked ? .gray : .blue)
//            )
//            .opacity(locked ? 0.6 : 1)
//                       .shadow(radius: locked ? 0 : 6)

        }
        //.disabled(locked)
    }

}

#Preview {
    CardView(playerName: "parker", isImposter: false, word: "school")
}
