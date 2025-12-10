//
//  AnswerButton.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import SwiftUI

struct AnswerButton: View {
    @State var answer: String
    var action: () -> Void
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.green)
            .frame(maxWidth: .infinity, maxHeight: 120)
            .overlay {
                Button(answer) {
                    action()
                }
                .foregroundStyle(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
    }
}

#Preview {
    AnswerButton(answer: "Pizza") {
        
    }
}
