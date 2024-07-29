//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Harshvardhan Singh Chauhan on 6/1/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
