//
//  Question.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation


class Question: ObservableObject {
   @Published var question: String
   @Published var answers: [String] //max of 4 choices
    
    init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
    }
    
    
    func setQuestion(question: String) {
        self.question = question;
    }
    
    func setAnswers(answers: [String]) {
        self.answers = answers
    }
    
}
