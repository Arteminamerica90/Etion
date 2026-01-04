//
//  LearningProgress.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

struct LearningProgress: Codable {
    var itemId: UUID
    var language: Language
    var timesShown: Int
    var timesCorrect: Int
    var lastShown: Date?
    var nextReview: Date
    var frequency: Int // количество раз в день
    var isLearned: Bool // выучено ли слово
    
    init(itemId: UUID, language: Language, frequency: Int = 10) {
        self.itemId = itemId
        self.language = language
        self.timesShown = 0
        self.timesCorrect = 0
        self.lastShown = nil
        self.nextReview = Date()
        self.frequency = frequency
        self.isLearned = false
    }
}

