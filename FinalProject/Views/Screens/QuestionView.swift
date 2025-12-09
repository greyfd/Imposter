//
//  QuestionView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import SwiftUI

struct QuestionView: View {
    @State var question: Question
    var body: some View {
        VStack {
            Spacer()
            Text(question.question)
                .font(.title)
                .padding(6)
            Spacer()
            VStack {
                HStack {
                    AnswerButton(answer: question.answers[0])
                    AnswerButton(answer: question.answers[1])

                }
                .frame(maxWidth: .infinity)

                HStack {
                    AnswerButton(answer: question.answers[2])
                    AnswerButton(answer: question.answers[3])
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
    }
}

#Preview {
    QuestionView(question:  Question(question: "What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"])
)
}
