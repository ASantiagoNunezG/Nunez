//
//  BoletaDePagosApp.swift
//  BoletaDePagos
//
//  Created by nunez on 26/11/24.
//

import SwiftUI

@main
struct BoletaDePagosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
