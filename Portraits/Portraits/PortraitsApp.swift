//
//  PortraitsApp.swift
//  Portraits
//
//  Created by Huanhuan Sun on 4/13/22.
//

import SwiftUI

@main
struct PortraitsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
