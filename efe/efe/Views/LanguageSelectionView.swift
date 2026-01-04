//
//  LanguageSelectionView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Binding var selectedLanguage: Language
    let languages: [Language] = Language.allCases
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    private var circleSize: CGFloat {
        isIPad ? 65 : 50
    }
    
    private var circleFontSize: CGFloat {
        isIPad ? 26 : 20
    }
    
    private var textFontSize: CGFloat {
        isIPad ? 13 : 11
    }
    
    private var buttonWidth: CGFloat {
        isIPad ? 80 : 70
    }
    
    private var spacing: CGFloat {
        isIPad ? 16 : 12
    }
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth = CGFloat(languages.count) * buttonWidth + CGFloat(languages.count - 1) * spacing
            let needsScroll = totalWidth > geometry.size.width
            
            if isIPad && !needsScroll {
                // На iPad, если все элементы помещаются, центрируем их
                HStack {
                    Spacer()
                    HStack(spacing: spacing) {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                selectedLanguage = language
                            }) {
                                VStack(spacing: 8) {
                                    ZStack {
                                        if selectedLanguage == language {
                                            Circle()
                                                .fill(Color(hex: "1C1C1E"))
                                                .frame(width: circleSize, height: circleSize)
                                        } else {
                                            Circle()
                                                .fill(Color(hex: "F5F5F7"))
                                                .frame(width: circleSize, height: circleSize)
                                                .shadow(
                                                    color: Color.white.opacity(0.7),
                                                    radius: 4,
                                                    x: -3,
                                                    y: -3
                                                )
                                                .shadow(
                                                    color: Color.black.opacity(0.1),
                                                    radius: 4,
                                                    x: 3,
                                                    y: 3
                                                )
                                        }
                                        
                                        Text(language.rawValue.prefix(1))
                                            .font(.system(size: circleFontSize, weight: .bold))
                                            .foregroundColor(selectedLanguage == language ? .white : Color(hex: "1C1C1E"))
                                    }
                                    
                                    Text(language.rawValue)
                                        .font(.system(size: textFontSize, weight: .medium))
                                        .foregroundColor(Color(hex: "1C1C1E"))
                                }
                                .frame(width: buttonWidth)
                            }
                        }
                    }
                    Spacer()
                }
            } else {
                // Если нужна прокрутка или на iPhone, используем ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: spacing) {
                        ForEach(languages, id: \.self) { language in
                            Button(action: {
                                selectedLanguage = language
                            }) {
                                VStack(spacing: 8) {
                                    ZStack {
                                        if selectedLanguage == language {
                                            Circle()
                                                .fill(Color(hex: "1C1C1E"))
                                                .frame(width: circleSize, height: circleSize)
                                        } else {
                                            Circle()
                                                .fill(Color(hex: "F5F5F7"))
                                                .frame(width: circleSize, height: circleSize)
                                                .shadow(
                                                    color: Color.white.opacity(0.7),
                                                    radius: 4,
                                                    x: -3,
                                                    y: -3
                                                )
                                                .shadow(
                                                    color: Color.black.opacity(0.1),
                                                    radius: 4,
                                                    x: 3,
                                                    y: 3
                                                )
                                        }
                                        
                                        Text(language.rawValue.prefix(1))
                                            .font(.system(size: circleFontSize, weight: .bold))
                                            .foregroundColor(selectedLanguage == language ? .white : Color(hex: "1C1C1E"))
                                    }
                                    
                                    Text(language.rawValue)
                                        .font(.system(size: textFontSize, weight: .medium))
                                        .foregroundColor(Color(hex: "1C1C1E"))
                                }
                                .frame(width: buttonWidth)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, isIPad ? 60 : 48)
                }
            }
        }
        .frame(height: isIPad ? 100 : 85)
    }
}

