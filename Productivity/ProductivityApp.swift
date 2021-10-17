//
//  ProductivityApp.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI

@main
struct ProductivityApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
