//
//  Question.swift
//  FinalProject
//
//  Created by GREYSON DOBBELS on 12/9/25.
//

import Foundation

class Question {
    var question: String
    var answers: [String] //max of 4 choices
    
    init(question: String, answers: [String]) {
        self.question = question
        self.answers = answers
    }
}
