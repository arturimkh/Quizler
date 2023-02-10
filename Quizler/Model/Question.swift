//
//  Question.swift
//  Quizler
//
//  Created by Artur Imanbaev on 03.02.2023.
//

import Foundation

struct Question{
    var text: String
    var answer: String
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
