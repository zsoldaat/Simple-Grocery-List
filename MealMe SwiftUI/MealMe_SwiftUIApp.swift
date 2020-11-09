//
//  MealMe_SwiftUIApp.swift
//  MealMe SwiftUI
//
//  Created by Zac Soldaat on 2020-11-09.
//

import SwiftUI

@main
struct MealMe_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
