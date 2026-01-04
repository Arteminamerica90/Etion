//
//  ContentView.swift
//  efe
//
//  Created by Artem Menshikov on 02.01.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
            .onAppear {
                NotificationService.shared.requestAuthorization()
                NotificationService.shared.scheduleNotifications(frequency: 10, language: .english)
            }
    }
}

#Preview {
    ContentView()
}
