//
//  SettingsView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct SettingsView: View {
    let category: Category?
    let language: Language
    @Binding var frequency: Int
    @State private var appFrequency: Int = 10
    @Environment(\.presentationMode) var presentationMode
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    private var isIPad: Bool {
        horizontalSizeClass == .regular
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                GradientBackground()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // Настройки для категории
                        if let category = category {
                            VStack(spacing: 20) {
                                VStack(spacing: 15) {
                                    Text(Localization.localizedString(for: "Настройки для категории:", language: language))
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(hex: "1C1C1E").opacity(0.7))
                                    
                                    Text(Localization.localizedString(for: category.name, language: language))
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(Color(hex: "1C1C1E"))
                                }
                                .padding()
                                .neumorphism(cornerRadius: 20, opacity: 0.15)
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(Localization.localizedString(for: "Частота напоминаний в день", language: language))
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundColor(Color(hex: "1C1C1E"))
                                    
                                    Stepper(value: $frequency, in: 1...20) {
                                        Text("\(frequency) \(Localization.localizedString(for: "раз", language: language))")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color(hex: "1C1C1E"))
                                    }
                                    .tint(Color(hex: "1C1C1E"))
                                }
                                .padding()
                                .neumorphism(cornerRadius: 20, opacity: 0.15)
                            }
                        }
                        
                        // Настройки для всего приложения
                        VStack(spacing: 20) {
                            VStack(spacing: 15) {
                                Text(Localization.localizedString(for: "Настройки для всего приложения:", language: language))
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "1C1C1E").opacity(0.7))
                            }
                            .padding()
                            .neumorphism(cornerRadius: 20, opacity: 0.15)
                            
                            VStack(alignment: .leading, spacing: 15) {
                                Text(Localization.localizedString(for: "Частота напоминаний в день", language: language))
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color(hex: "1C1C1E"))
                                
                                Stepper(value: $appFrequency, in: 1...20) {
                                    Text("\(appFrequency) \(Localization.localizedString(for: "раз", language: language))")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color(hex: "1C1C1E"))
                                }
                                .tint(Color(hex: "1C1C1E"))
                            }
                            .padding()
                            .neumorphism(cornerRadius: 20, opacity: 0.15)
                        }
                        
                        Button(action: {
                            // Сохраняем настройки для категории
                            if let category = category {
                                NotificationService.shared.setCategoryFrequency(category: category.name, frequency: frequency, language: language)
                            }
                            
                            // Сохраняем настройки для всего приложения
                            NotificationService.shared.setAppFrequency(frequency: appFrequency, language: language)
                            
                            presentationMode.wrappedValue.dismiss()
                        }) {
                        Text(Localization.localizedString(for: "Сохранить", language: language))
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(hex: "1C1C1E"))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(hex: "F5F5F7"))
                                    .shadow(
                                        color: Color.white.opacity(0.7),
                                        radius: 6,
                                        x: -4,
                                        y: -4
                                    )
                                    .shadow(
                                        color: Color.black.opacity(0.2),
                                        radius: 6,
                                        x: 4,
                                        y: 4
                                    )
                            )
                        }
                        .padding(.horizontal, isIPad ? 80 : 64)
                    }
                    .padding(.horizontal, isIPad ? 80 : 64)
                    .padding(.vertical)
                }
            }
            .navigationTitle(Localization.localizedString(for: "Настройки", language: language))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(Localization.localizedString(for: "Закрыть", language: language)) {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color(hex: "1C1C1E"))
                }
            }
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
                
                // Загружаем текущие настройки приложения
                appFrequency = NotificationService.shared.getAppFrequency()
                
                // Загружаем частоту для категории, если она установлена
                if let category = category {
                    frequency = NotificationService.shared.getCategoryFrequency(category: category.name)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

