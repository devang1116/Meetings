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
    @State private var scrums = DailyScrum.data
    @ObservedObject private var data = ScrumData()

    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                ScrumsView(scrums: $data.scrums )
                {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
