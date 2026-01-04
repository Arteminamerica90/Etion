//
//  CategoriesData.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import Foundation

class CategoriesData {
    static let shared = CategoriesData()
    
    let categories: [Category] = [
        Category(name: "Маркетинг", icon: "megaphone.fill", color: "FF6B9D"),
        Category(name: "Финансы", icon: "dollarsign.circle.fill", color: "4ECDC4"),
        Category(name: "Технологии", icon: "laptopcomputer", color: "5DADE2"),
        Category(name: "Бизнес-стратегия", icon: "chart.line.uptrend.xyaxis", color: "00BCD4"),
        Category(name: "Управление проектами", icon: "list.bullet.clipboard.fill", color: "F8C471"),
        Category(name: "Продажи", icon: "cart.fill", color: "F39C12"),
        Category(name: "HR и рекрутинг", icon: "person.2.fill", color: "3498DB"),
        Category(name: "Операции", icon: "gearshape.fill", color: "95E1D3"),
        Category(name: "Аналитика данных", icon: "chart.bar.fill", color: "673AB7"),
        Category(name: "Корпоративные финансы", icon: "banknote.fill", color: "EC7063"),
        Category(name: "Инвестиции", icon: "chart.pie.fill", color: "E67E22"),
        Category(name: "Бухгалтерия", icon: "doc.text.fill", color: "607D8B"),
        Category(name: "Цифровой маркетинг", icon: "network", color: "2196F3"),
        Category(name: "Брендинг", icon: "sparkles", color: "E91E63"),
        Category(name: "Контент-маркетинг", icon: "doc.richtext.fill", color: "9B59B6"),
        Category(name: "SEO и SEM", icon: "magnifyingglass", color: "FF9800"),
        Category(name: "Социальные медиа", icon: "person.3.fill", color: "E74C3C"),
        Category(name: "E-commerce", icon: "bag.fill", color: "F1C40F"),
        Category(name: "Программирование", icon: "curlybraces", color: "00BCD4"),
        Category(name: "Кибербезопасность", icon: "lock.shield.fill", color: "FF5722"),
        Category(name: "Искусственный интеллект", icon: "brain.head.profile", color: "9C27B0"),
        Category(name: "Облачные технологии", icon: "cloud.fill", color: "03A9F4"),
        Category(name: "Блокчейн", icon: "link", color: "795548"),
        Category(name: "Мобильная разработка", icon: "iphone", color: "4CAF50"),
        Category(name: "Веб-разработка", icon: "globe", color: "FF6F00"),
        Category(name: "DevOps", icon: "server.rack", color: "8BC34A"),
        Category(name: "Управление рисками", icon: "exclamationmark.triangle.fill", color: "FF6B6B"),
        Category(name: "Стратегическое планирование", icon: "map.fill", color: "AA96DA"),
        Category(name: "Лидерство", icon: "person.crop.circle.badge.checkmark", color: "FCBAD3"),
        Category(name: "Переговоры", icon: "hand.raised.fill", color: "A8E6CF"),
        Category(name: "Презентации", icon: "rectangle.on.rectangle", color: "FFD93D"),
        Category(name: "Клиентский сервис", icon: "headphones", color: "6BCB77"),
        Category(name: "Логистика", icon: "shippingbox.fill", color: "4D96FF"),
        Category(name: "Цепочка поставок", icon: "arrow.triangle.branch", color: "FFA07A"),
        Category(name: "Качество продукции", icon: "checkmark.seal.fill", color: "98D8C8"),
        Category(name: "Исследования рынка", icon: "chart.bar.doc.horizontal.fill", color: "F7DC6F"),
        Category(name: "Потребительское поведение", icon: "person.fill.questionmark", color: "BB8FCE"),
        Category(name: "Международный бизнес", icon: "globe.europe.africa.fill", color: "85C1E2"),
        Category(name: "Юридические вопросы", icon: "scale.3d", color: "F1948A"),
        Category(name: "Интеллектуальная собственность", icon: "doc.badge.plus", color: "7FB3D3"),
        Category(name: "Налогообложение", icon: "doc.text.magnifyingglass", color: "A569BD"),
        Category(name: "Аудит", icon: "checklist", color: "FFB84D"),
        Category(name: "Финансовое планирование", icon: "calendar.badge.clock", color: "FF6B9D"),
        Category(name: "Управление активами", icon: "building.2.fill", color: "4ECDC4"),
        Category(name: "Венчурный капитал", icon: "chart.line.uptrend.xyaxis.circle.fill", color: "5DADE2"),
        Category(name: "Стартапы", icon: "sparkles", color: "F8C471"),
        Category(name: "Инновации", icon: "lightbulb.fill", color: "F39C12"),
        Category(name: "Устойчивое развитие", icon: "leaf.fill", color: "3498DB"),
        Category(name: "Корпоративная этика", icon: "hand.raised.fill", color: "95E1D3"),
        Category(name: "Управление изменениями", icon: "arrow.triangle.2.circlepath", color: "673AB7"),
        Category(name: "Организационная культура", icon: "person.3.sequence.fill", color: "EC7063"),
        Category(name: "Грамматика - Местоимения", icon: "person.text.rectangle", color: "FF6B9D"),
        Category(name: "Грамматика - Артикли", icon: "text.book.closed", color: "4ECDC4"),
        Category(name: "Грамматика - Предлоги", icon: "arrow.right.circle", color: "5DADE2"),
        Category(name: "Грамматика - Союзы", icon: "link.circle", color: "00BCD4"),
        Category(name: "Грамматика - Наречия", icon: "textformat", color: "F8C471"),
        Category(name: "Грамматика - Глаголы", icon: "play.circle.fill", color: "E74C3C"),
        Category(name: "Грамматика - Правила", icon: "book.fill", color: "9B59B6")
    ]
    
    private init() {}
}

