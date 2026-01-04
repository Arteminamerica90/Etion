//
//  GradientBackground.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "F5F5F7"),
                    Color(hex: "FFFFFF"),
                    Color(hex: "F8F8FA")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // Декоративные круги
            Circle()
                .fill(Color(hex: "CCB4EA").opacity(0.7))
                .frame(width: 400, height: 400)
                .offset(x: -150, y: -200)
                .blur(radius: 15)
            
            Circle()
                .fill(Color(hex: "CCB4EA").opacity(0.6))
                .frame(width: 500, height: 500)
                .offset(x: 200, y: 400)
                .blur(radius: 20)
        }
        .ignoresSafeArea()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

