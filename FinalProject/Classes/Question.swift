//
//  Question.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation


class Question: ObservableObject, Equatable, Hashable {
   @Published var question: String
   @Published var answers: [String] //max of 4 choices
    @Published var id: UUID
    
    init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
        id = UUID()
    }
    
    
    func setQuestion(question: String) {
        self.question = question;
    }
    
    func setAnswers(answers: [String]) {
        self.answers = answers
    }
    
    func setSelf(question: Question) {
        setQuestion(question: question.question)
        setAnswers(answers: question.answers)
    }
    
    static func ==(lhs: Question, rhs: Question) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
