//
//  DifficultyLevel.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

enum DifficultyLevel: String, CaseIterable, Codable {
    case beginner = "Начальный"
    case intermediate = "Средний"
    case advanced = "Продвинутый"
    
    var description: String {
        switch self {
        case .beginner: return "Базовые термины и понятия"
        case .intermediate: return "Профессиональная лексика"
        case .advanced: return "Сложные концепции и выражения"
        }
    }
}

