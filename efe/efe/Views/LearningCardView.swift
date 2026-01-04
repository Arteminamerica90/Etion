//
//  LearningCardView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct LearningCardView: View {
    let item: LearningItem
    let language: Language
    let baseLanguage: Language
    @State private var showTranslation = false
    @State private var showExamples = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Тип элемента
                HStack {
                    Spacer()
                        Text(item.type.rawValue.capitalized)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(hex: "1C1C1E").opacity(0.6))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .neumorphism(cornerRadius: 15)
                }
                
                // Текст на базовом языке
                VStack(spacing: 8) {
                    Text(item.getBaseText(baseLanguage: baseLanguage))
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color(hex: "1C1C1E"))
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.7)
                        .lineLimit(3)
                    
                    // Расшифровка аббревиатуры, если это аббревиатура
                    let baseText = item.getBaseText(baseLanguage: baseLanguage)
                    if AcronymDatabase.shared.isAcronym(baseText),
                       let decryption = AcronymDatabase.shared.getDecryption(for: baseText, language: language) {
                        Text(decryption)
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(Color(hex: "1C1C1E").opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                .padding()
                
                // Перевод
                if showTranslation {
                    VStack(spacing: 12) {
                        Text(item.getTranslation(targetLanguage: language, baseLanguage: baseLanguage))
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(Color(hex: "1C1C1E"))
                            .multilineTextAlignment(.center)
                            .padding()
                            .minimumScaleFactor(0.7)
                            .lineLimit(3)
                            .transition(.opacity)
                        
                        // Примеры предложений (только для слов)
                        if item.type == .word, let examples = item.exampleSentences, !examples.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                Text(Localization.localizedString(for: "Примеры использования:", language: language))
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color(hex: "1C1C1E"))
                                    .padding(.top, 8)
                                
                                ForEach(Array(examples.enumerated()), id: \.offset) { index, example in
                                    ExampleSentenceView(
                                        example: example,
                                        word: item.getBaseText(baseLanguage: baseLanguage),
                                        language: language,
                                        baseLanguage: baseLanguage,
                                        position: example.wordPosition
                                    )
                                }
                            }
                            .padding()
                            .neumorphism(cornerRadius: 15)
                        }
                    }
                } else {
                    Button(action: {
                        withAnimation {
                            showTranslation.toggle()
                        }
                    }) {
                        Text(Localization.localizedString(for: "Показать перевод", language: language))
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(hex: "1C1C1E"))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .neumorphism(cornerRadius: 20)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(30)
        }
        .neumorphism(cornerRadius: 30, opacity: 0.15)
        .onAppear {
            showTranslation = false
        }
    }
}

// Вью для отображения примера предложения
struct ExampleSentenceView: View {
    let example: LearningItem.ExampleSentence
    let word: String
    let language: Language
    let baseLanguage: Language
    let position: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Перевод предложения (сверху)
            Text(example.translations[language] ?? "")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(Color(hex: "1C1C1E"))
            
            // Предложение на базовом языке с выделением слова (снизу)
            HighlightedSentenceView(
                sentence: baseLanguage == .russian ? example.russian : (example.translations[baseLanguage] ?? example.russian),
                word: word,
                position: position
            )
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(Color(hex: "1C1C1E").opacity(0.7))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .neumorphism(cornerRadius: 10)
    }
}

// Вью для выделения слова в предложении
struct HighlightedSentenceView: View {
    let sentence: String
    let word: String
    let position: Int
    
    var body: some View {
        Text(highlightedText)
            .multilineTextAlignment(.leading)
    }
    
    private var highlightedText: AttributedString {
        var attributedString = AttributedString(sentence)
        
        // Делаем весь текст жирным по умолчанию, без выделения
        attributedString.font = .system(size: 18, weight: .bold)
        
        return attributedString
    }
}

// Расширение для безопасного доступа к массиву
extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

