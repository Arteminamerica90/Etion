//
//  Language.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

enum Language: String, CaseIterable, Codable {
    case russian = "Русский"
    case english = "English"
    case french = "Français"
    case spanish = "Español"
    case chinese = "中文"
    case portuguese = "Português"
    case italian = "Italiano"
    
    var code: String {
        switch self {
        case .russian: return "ru"
        case .english: return "en"
        case .french: return "fr"
        case .spanish: return "es"
        case .chinese: return "zh"
        case .portuguese: return "pt"
        case .italian: return "it"
        }
    }
}

