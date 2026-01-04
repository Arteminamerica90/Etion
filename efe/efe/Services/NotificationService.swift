//
//  NotificationService.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation
import UserNotifications

class NotificationService {
    static let shared = NotificationService()
    
    // Храним частоту для категорий и для всего приложения
    private var categoryFrequencies: [String: Int] = [:]
    private var appFrequency: Int = 10
    private let appFrequencyKey = "app_notification_frequency"
    
    private init() {
        // Загружаем сохраненную частоту для приложения
        appFrequency = UserDefaults.standard.integer(forKey: appFrequencyKey)
        if appFrequency == 0 {
            appFrequency = 10 // Значение по умолчанию
        }
    }
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted")
            } else if let error = error {
                print("Notification permission error: \(error)")
            }
        }
    }
    
    func scheduleNotifications(frequency: Int = 10, language: Language = .english) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Получаем слова для уведомлений (исключая выученные)
        let itemsForNotifications = LearningData.shared.getItemsForNotifications(language: language)
        
        // Если нет слов для изучения, не планируем уведомления
        guard !itemsForNotifications.isEmpty else {
            print("No items to learn - skipping notifications")
            return
        }
        
        // Распределяем напоминания равномерно в течение дня (с 8 утра до 22 вечера)
        let startHour = 8
        let endHour = 22
        let activeHours = endHour - startHour
        let minutesBetween = (activeHours * 60) / frequency
        
        for i in 0..<frequency {
            // Выбираем случайное слово из списка для каждого уведомления
            let randomItem = itemsForNotifications.randomElement() ?? itemsForNotifications[0]
            
            let content = UNMutableNotificationContent()
            content.title = "Время учиться! 📚"
            content.body = "Повторите: \(randomItem.russian)"
            content.sound = .default
            content.badge = 1
            
            let totalMinutes = startHour * 60 + (i * minutesBetween)
            let targetHour = totalMinutes / 60
            let targetMinute = totalMinutes % 60
            
            var dateComponents = DateComponents()
            dateComponents.hour = targetHour
            dateComponents.minute = targetMinute
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(
                identifier: "learning_reminder_\(i)",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
    }
    
    func updateNotificationFrequency(frequency: Int, language: Language = .english) {
        scheduleNotifications(frequency: frequency, language: language)
    }
    
    func updateNotificationFrequency(frequency: Int) {
        scheduleNotifications(frequency: frequency)
    }
    
    // Установить частоту для категории
    func setCategoryFrequency(category: String, frequency: Int, language: Language) {
        categoryFrequencies[category] = frequency
        // Перепланируем уведомления с учетом новой частоты
        scheduleNotifications(frequency: appFrequency, language: language)
    }
    
    // Получить частоту для категории
    func getCategoryFrequency(category: String) -> Int {
        return categoryFrequencies[category] ?? appFrequency
    }
    
    // Установить частоту для всего приложения
    func setAppFrequency(frequency: Int, language: Language) {
        appFrequency = frequency
        UserDefaults.standard.set(frequency, forKey: appFrequencyKey)
        // Перепланируем уведомления
        scheduleNotifications(frequency: frequency, language: language)
    }
    
    // Получить частоту для всего приложения
    func getAppFrequency() -> Int {
        return appFrequency
    }
}

