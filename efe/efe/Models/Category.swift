//
//  Category.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

struct Category: Identifiable, Codable {
    let id: UUID
    let name: String
    let icon: String
    let color: String
    
    init(id: UUID = UUID(), name: String, icon: String, color: String) {
        self.id = id
        self.name = name
        self.icon = icon
        self.color = color
    }
}

