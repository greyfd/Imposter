//
//  QuestionView.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import SwiftUI

struct QuestionView: View {
    @StateObject var question: Question
    let game: Game = Game(numberOfPlayers: 4, category: .Sports)
    @State var peopleAnswered: Int = 0
    var body: some View {
        
        Text("\(peopleAnswered)")
        
        VStack {
            
        
            
            Spacer()
            Text(question.question)
                .font(.title)
                .padding(6)
            Spacer()
            VStack {
                HStack {
                    AnswerButton(answer: question.answers[0]) {
                        answerQuestion()
                    }
                    AnswerButton(answer: question.answers[1]) {
                        answerQuestion()
                    }

                }
                .frame(maxWidth: .infinity)

                HStack {
                    AnswerButton(answer: question.answers[2]) {
                        answerQuestion()
                    }
                    AnswerButton(answer: question.answers[3]) {
                        answerQuestion()
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Spacer()
        }
        .background(game.players[peopleAnswered].isImposter ? .red : .blue)
    }
    
    func answerQuestion() {
        let player = game.getPlayer(index: peopleAnswered)
        
        player.answers.append(question.answers[0])
        
        print(player.answers.first)
        
        
        if (peopleAnswered == game.players.count - 1) {
            let newQuestion = game.nextQuestion()
            question.setAnswers(answers: newQuestion.answers)
            question.setQuestion(question: newQuestion.question)

            peopleAnswered = 0
        }
        
        peopleAnswered += 1;

    }
    
}

#Preview {
    QuestionView(question:  Question(question: "What is the things favorite food?", answers: ["Pizza", "Chicken", "Tacos", "Pasta"])
)
}
