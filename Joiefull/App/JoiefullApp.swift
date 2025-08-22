//
//  JoiefullApp.swift
//  Joiefull
//
//  Created by Pascal Jesenberger on 03/08/2025.
//

import SwiftUI

@main
struct JoiefullApp: App {
    @StateObject private var deviceEnvironment = DeviceEnvironment()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
                .environmentObject(deviceEnvironment)
                .onReceive(NotificationCenter.default.publisher(for: UIContentSizeCategory.didChangeNotification)) { _ in
                    deviceEnvironment.updateFromUIKit(UIApplication.shared.preferredContentSizeCategory)
                }
        }
    }
}
