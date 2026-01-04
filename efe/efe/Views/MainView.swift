//
//  MainView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI
import UIKit

struct MainView: View {
    @State private var selectedLanguage: Language = .english // Язык для перевода
    @State private var baseLanguage: Language = .russian // Базовый язык (с какого переводим)
    @State private var showSettings = false
    @State private var appFrequency: Int = 10
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    let categories = CategoriesData.shared.categories
    
    var body: some View {
        NavigationView {
            ZStack {
                GradientBackground()
                
                VStack(spacing: 0) {
                    // Заголовок
                    VStack(spacing: 8) {
                        Text(Localization.localizedString(for: "Выберите язык и тематику", language: selectedLanguage))
                            .font(.system(size: isIPad ? 18 : 16))
                            .foregroundColor(Color(hex: "1C1C1E"))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                    .padding(.horizontal, isIPad ? 60 : 48)
                    
                    // Выбор базового языка
                    VStack(spacing: 6) {
                        Text(Localization.localizedString(for: "Базовый язык (с какого переводим)", language: selectedLanguage))
                            .font(.system(size: isIPad ? 16 : 14))
                            .foregroundColor(Color(hex: "1C1C1E").opacity(0.8))
                            .multilineTextAlignment(.center)
                        LanguageSelectionView(selectedLanguage: $baseLanguage)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 16)
                    .padding(.horizontal, isIPad ? 60 : 48)
                    
                    // Выбор языка для перевода
                    VStack(spacing: 6) {
                        Text(Localization.localizedString(for: "Язык для перевода", language: selectedLanguage))
                            .font(.system(size: isIPad ? 16 : 14))
                            .foregroundColor(Color(hex: "1C1C1E").opacity(0.8))
                            .multilineTextAlignment(.center)
                        LanguageSelectionView(selectedLanguage: $selectedLanguage)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .padding(.horizontal, isIPad ? 60 : 48)
                    
                    // Сетка категорий
                    CategoriesGridView(categories: categories, selectedLanguage: selectedLanguage, baseLanguage: baseLanguage)
                }
                .frame(maxWidth: .infinity) // Используем всю ширину на iPad
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(Localization.localizedString(for: "Изучение языков", language: selectedLanguage))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showSettings = true }) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(Color(hex: "1C1C1E"))
                    }
                }
            }
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(hex: "F5F5F7")
                appearance.shadowColor = .clear // Убираем разделитель
                appearance.titleTextAttributes = [.foregroundColor: UIColor(hex: "1C1C1E")]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(hex: "1C1C1E")]
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                
                // Загружаем частоту для приложения
                appFrequency = NotificationService.shared.getAppFrequency()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(
                    category: nil,
                    language: selectedLanguage,
                    frequency: $appFrequency
                )
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UIColor {
    convenience init(hex: String) {
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
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}

