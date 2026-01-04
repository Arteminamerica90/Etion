//
//  NeumorphismModifier.swift
//  efe
//
//  Created by Artem Menshikov on 04.01.2026.
//

import SwiftUI

struct NeumorphismModifier: ViewModifier {
    var isPressed: Bool = false
    var cornerRadius: CGFloat = 20
    var opacity: Double = 1.0
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color(hex: "F5F5F7").opacity(opacity))
                    .shadow(
                        color: Color.white.opacity(0.7),
                        radius: isPressed ? 3 : 8,
                        x: isPressed ? -2 : -6,
                        y: isPressed ? -2 : -6
                    )
                    .shadow(
                        color: Color.black.opacity(0.15),
                        radius: isPressed ? 3 : 8,
                        x: isPressed ? 2 : 6,
                        y: isPressed ? 2 : 6
                    )
            )
    }
}

extension View {
    func neumorphism(cornerRadius: CGFloat = 20, isPressed: Bool = false, opacity: Double = 1.0) -> some View {
        self.modifier(NeumorphismModifier(isPressed: isPressed, cornerRadius: cornerRadius, opacity: opacity))
    }
}

