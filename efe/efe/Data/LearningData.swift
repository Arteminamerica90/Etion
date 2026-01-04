//
//  LearningData.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class LearningData {
    static let shared = LearningData()
    
    private var items: [LearningItem] = []
    private var progress: [UUID: [Language: LearningProgress]] = [:]
    
    private init() {
        loadInitialData()
    }
    
    func getAllItems() -> [LearningItem] {
        return items
    }
    
    func getItems(for category: String) -> [LearningItem] {
        return items.filter { $0.category == category }
    }
    
    func getItems(for category: String, difficulty: DifficultyLevel) -> [LearningItem] {
        // Для грамматических категорий не фильтруем по уровню сложности
        if category.contains("Грамматика -") {
            return items.filter { $0.category == category }
        }
        return items.filter { $0.category == category && $0.difficulty == difficulty }
    }
    
    func getProgress(for itemId: UUID, language: Language) -> LearningProgress? {
        return progress[itemId]?[language]
    }
    
    func updateProgress(itemId: UUID, language: Language, isCorrect: Bool) {
        if progress[itemId] == nil {
            progress[itemId] = [:]
        }
        
        if var currentProgress = progress[itemId]?[language] {
            currentProgress.timesShown += 1
            if isCorrect {
                currentProgress.timesCorrect += 1
                // Если пользователь правильно ответил, помечаем слово как выученное
                currentProgress.isLearned = true
            } else {
                // Если пользователь неправильно ответил, помечаем слово как невыученное
                currentProgress.isLearned = false
            }
            currentProgress.lastShown = Date()
            currentProgress.nextReview = calculateNextReview(currentProgress: currentProgress)
            progress[itemId]?[language] = currentProgress
        } else {
            var newProgress = LearningProgress(itemId: itemId, language: language)
            newProgress.timesShown = 1
            if isCorrect {
                newProgress.timesCorrect = 1
                // Если пользователь правильно ответил, помечаем слово как выученное
                newProgress.isLearned = true
            } else {
                // Если пользователь неправильно ответил, помечаем слово как невыученное
                newProgress.isLearned = false
            }
            newProgress.lastShown = Date()
            progress[itemId]?[language] = newProgress
        }
    }
    
    func setFrequency(itemId: UUID, language: Language, frequency: Int) {
        if progress[itemId] == nil {
            progress[itemId] = [:]
        }
        if var currentProgress = progress[itemId]?[language] {
            currentProgress.frequency = frequency
            progress[itemId]?[language] = currentProgress
        } else {
            let newProgress = LearningProgress(itemId: itemId, language: language, frequency: frequency)
            progress[itemId]?[language] = newProgress
        }
    }
    
    private func calculateNextReview(currentProgress: LearningProgress) -> Date {
        let calendar = Calendar.current
        let frequency = max(currentProgress.frequency, 1) // Защита от деления на ноль
        let hoursBetween = 24.0 / Double(frequency)
        return calendar.date(byAdding: .hour, value: Int(hoursBetween), to: Date()) ?? Date()
    }
    
    func getItemsForReview(language: Language) -> [LearningItem] {
        let now = Date()
        return items.filter { item in
            guard let progress = getProgress(for: item.id, language: language) else {
                return true // Новые элементы показываем сразу
            }
            // Исключаем выученные слова из списка для повторения
            if progress.isLearned {
                return false
            }
            return progress.nextReview <= now
        }
    }
    
    // Получить слова для уведомлений (исключая выученные)
    func getItemsForNotifications(language: Language) -> [LearningItem] {
        return items.filter { item in
            guard let progress = getProgress(for: item.id, language: language) else {
                return true // Новые элементы включаем в уведомления
            }
            // Исключаем выученные слова из уведомлений
            return !progress.isLearned
        }
    }
    
    private func loadInitialData() {
        // Загружаем данные из генератора
        items = LearningDataGenerator.generateAllData()
        
        // Загружаем грамматические элементы (один раз, так как переводы уже включены)
        let grammarItems = GrammarDatabase.shared.getAllGrammarItems(for: .english)
        items.append(contentsOf: grammarItems)
    }
}

