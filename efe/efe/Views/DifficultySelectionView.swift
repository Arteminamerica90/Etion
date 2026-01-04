//
//  DifficultySelectionView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI
import UIKit

struct DifficultySelectionView: View {
    let category: Category
    let language: Language
    let baseLanguage: Language
    @State private var selectedDifficulty: DifficultyLevel = .beginner
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 30) {
                Text(Localization.localizedString(for: "Выберите уровень сложности", language: language))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(hex: "1C1C1E"))
                    .padding(.top, 40)
                
                VStack(spacing: 20) {
                    ForEach(DifficultyLevel.allCases, id: \.self) { difficulty in
                        NavigationLink(destination: LearningView(category: category, language: language, baseLanguage: baseLanguage, difficulty: difficulty)) {
                            DifficultyCardView(
                                difficulty: difficulty,
                                language: language,
                                isSelected: selectedDifficulty == difficulty
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, isIPad ? 80 : 64)
                .padding(.vertical)
                
                Spacer()
            }
        }
        .navigationTitle(Localization.localizedString(for: category.name, language: language))
        .navigationBarTitleDisplayMode(.inline)
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
        }
    }
}

struct DifficultyCardView: View {
    let difficulty: DifficultyLevel
    let language: Language
    let isSelected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(Localization.localizedString(for: difficulty.rawValue, language: language))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "1C1C1E"))
                
                Text(Localization.localizedString(for: difficulty.description, language: language))
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "1C1C1E").opacity(0.7))
            }
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "1C1C1E"))
            }
        }
        .padding()
        .neumorphism(cornerRadius: 15, isPressed: isSelected, opacity: 0.15)
    }
}

