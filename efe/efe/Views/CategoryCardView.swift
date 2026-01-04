//
//  CategoryCardView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct CategoryCardView: View {
    let category: Category
    let language: Language
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    private var iconSize: CGFloat {
        isIPad ? 80 : 55
    }
    
    private var iconFontSize: CGFloat {
        isIPad ? 35 : 24
    }
    
    private var textFontSize: CGFloat {
        isIPad ? 18 : 12
    }
    
    private var cardWidth: CGFloat {
        isIPad ? 130 : 90
    }
    
    private var cardHeight: CGFloat {
        isIPad ? 200 : 120
    }
    
    private var cornerRadius: CGFloat {
        isIPad ? 20 : 16
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Иконка сверху
            ZStack {
                Circle()
                    .fill(Color(hex: "F5F5F7"))
                    .frame(width: iconSize, height: iconSize)
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
                
                Image(systemName: category.icon)
                    .font(.system(size: iconFontSize))
                    .foregroundColor(Color(hex: "1C1C1E"))
            }
            .frame(height: iconSize)
            .padding(.top, isIPad ? 16 : 10)
            .padding(.bottom, isIPad ? 12 : 6)
            
            // Spacer для разделения
            Spacer(minLength: isIPad ? 6 : 3)
            
            // Текст снизу
            Text(Localization.localizedString(for: category.name, language: language))
                .font(.system(size: textFontSize, weight: .medium))
                .foregroundColor(Color(hex: "1C1C1E"))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: isIPad ? 60 : 35)
                .padding(.horizontal, isIPad ? 6 : 6)
                .padding(.bottom, isIPad ? 16 : 10)
        }
        .frame(width: cardWidth, height: cardHeight)
        .neumorphism(cornerRadius: cornerRadius)
    }
}

