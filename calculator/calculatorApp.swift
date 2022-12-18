//
//  calculatorApp.swift
//  calculator
//
//  Created by Charlene Cheung on 17/12/2022.
//

import SwiftUI

@main
struct calculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
