//
//  LearningItem.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

struct LearningItem: Identifiable, Codable {
    let id: UUID
    let type: ItemType
    let russian: String // Оставляем для обратной совместимости
    let translations: [Language: String] // Переводы на все языки
    let category: String
    let difficulty: DifficultyLevel
    let exampleSentences: [ExampleSentence]? // Примеры предложений для слов
    
    enum ItemType: String, Codable {
        case word = "word"
        case phrase = "phrase"
        case sentence = "sentence"
    }
    
    struct ExampleSentence: Codable {
        let russian: String // Базовый язык
        let translations: [Language: String] // Переводы на все языки
        let wordPosition: Int // Позиция слова в предложении (индекс слова, начиная с 0)
    }
    
    // Получить текст на базовом языке
    func getBaseText(baseLanguage: Language) -> String {
        if baseLanguage == .russian {
            return russian
        }
        return translations[baseLanguage] ?? russian
    }
    
    // Получить перевод на целевой язык
    func getTranslation(targetLanguage: Language, baseLanguage: Language) -> String {
        if targetLanguage == baseLanguage {
            return getBaseText(baseLanguage: baseLanguage)
        }
        if targetLanguage == .russian {
            return russian
        }
        return translations[targetLanguage] ?? ""
    }
    
    // Получить текст примера на базовом языке
    func getExampleBaseText(example: ExampleSentence, baseLanguage: Language) -> String {
        if baseLanguage == .russian {
            return example.russian
        }
        return example.translations[baseLanguage] ?? example.russian
    }
    
    // Получить перевод примера на целевой язык
    func getExampleTranslation(example: ExampleSentence, targetLanguage: Language, baseLanguage: Language) -> String {
        if targetLanguage == baseLanguage {
            return getExampleBaseText(example: example, baseLanguage: baseLanguage)
        }
        if targetLanguage == .russian {
            return example.russian
        }
        return example.translations[targetLanguage] ?? ""
    }
    
    init(id: UUID = UUID(), type: ItemType, russian: String, translations: [Language: String], category: String, difficulty: DifficultyLevel = .intermediate, exampleSentences: [ExampleSentence]? = nil) {
        self.id = id
        self.type = type
        self.russian = russian
        self.translations = translations
        self.category = category
        self.difficulty = difficulty
        self.exampleSentences = exampleSentences
    }
}

