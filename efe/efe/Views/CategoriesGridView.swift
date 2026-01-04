//
//  CategoriesGridView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct CategoriesGridView: View {
    let categories: [Category]
    let selectedLanguage: Language
    let baseLanguage: Language
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    private var columns: [GridItem] {
        if isIPad {
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        } else {
            return [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        }
    }
    
    private var spacing: CGFloat {
        isIPad ? 16 : 12
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(categories) { category in
                    // Для грамматических категорий сразу переходим к обучению без выбора уровня
                    if category.name.contains("Грамматика -") {
                        NavigationLink(destination: LearningView(category: category, language: selectedLanguage, baseLanguage: baseLanguage, difficulty: .intermediate)) {
                            CategoryCardView(category: category, language: selectedLanguage)
                        }
                        .buttonStyle(PlainButtonStyle())
                    } else {
                        NavigationLink(destination: DifficultySelectionView(category: category, language: selectedLanguage, baseLanguage: baseLanguage)) {
                            CategoryCardView(category: category, language: selectedLanguage)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.horizontal, isIPad ? 60 : 48)
            .padding(.vertical, isIPad ? 12 : 12)
        }
    }
}

