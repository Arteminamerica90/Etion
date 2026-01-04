//
//  LearningView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI
import UIKit

struct LearningView: View {
    let category: Category
    let language: Language
    let baseLanguage: Language
    let difficulty: DifficultyLevel
    @State private var currentItemIndex = 0
    @State private var items: [LearningItem] = []
    @State private var showSettings = false
    @State private var frequency = 10
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    init(category: Category, language: Language, baseLanguage: Language, difficulty: DifficultyLevel = .beginner) {
        self.category = category
        self.language = language
        self.baseLanguage = baseLanguage
        self.difficulty = difficulty
    }
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 0) {
                
                if items.isEmpty {
                    Spacer()
                    Text(Localization.localizedString(for: "Нет элементов для изучения", language: language))
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "1C1C1E").opacity(0.6))
                    Spacer()
                } else {
                    // Карточка обучения
                    LearningCardView(
                        item: items[currentItemIndex],
                        language: language,
                        baseLanguage: baseLanguage
                    )
                    .id("\(items[currentItemIndex].id)-\(currentItemIndex)")
                    .padding(.horizontal, isIPad ? 80 : 64)
                    .padding(.vertical)
                    
                    // Кнопки управления
                    HStack(spacing: 20) {
                        Button(action: {
                            LearningData.shared.updateProgress(
                                itemId: items[currentItemIndex].id,
                                language: language,
                                isCorrect: false
                            )
                            // Обновляем уведомления, включая невыученное слово
                            NotificationService.shared.scheduleNotifications(frequency: frequency, language: language)
                            nextItem()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.red.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            LearningData.shared.updateProgress(
                                itemId: items[currentItemIndex].id,
                                language: language,
                                isCorrect: true
                            )
                            // Обновляем уведомления, исключая выученное слово
                            NotificationService.shared.scheduleNotifications(frequency: frequency, language: language)
                            nextItem()
                        }) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.green.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, isIPad ? 80 : 64)
                    .padding(.bottom, 30)
                    
                    // Прогресс
                    Text("\(currentItemIndex + 1) / \(items.count)")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "1C1C1E").opacity(0.6))
                        .padding(.bottom, 20)
                }
            }
        }
        .navigationTitle(Localization.localizedString(for: category.name, language: language))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color(hex: "1C1C1E"))
                    }
                }
        }
        .onAppear {
            // Настройка навигационной панели
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(hex: "F5F5F7")
            appearance.shadowColor = .clear
            appearance.titleTextAttributes = [.foregroundColor: UIColor(hex: "1C1C1E")]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hex: "1C1C1E")]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            loadItems()
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(
                category: category,
                language: language,
                frequency: $frequency
            )
        }
    }
    
    private func loadItems() {
        items = LearningData.shared.getItems(for: category.name, difficulty: difficulty)
    }
    
    private func nextItem() {
        if currentItemIndex < items.count - 1 {
            withAnimation {
                currentItemIndex += 1
            }
        } else {
            // Завершили все элементы, можно вернуться или начать заново
            withAnimation {
                currentItemIndex = 0
            }
        }
    }
}

