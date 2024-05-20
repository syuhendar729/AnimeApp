//
//  AnimeApp.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI
import CoreData

@main
struct AnimeApp: App {
    @State private var modelData = ModelData()
    // MARK: Core Data
    @StateObject private var manager: CoreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                // MARK: Core Data
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
                .environment(modelData)
        }
    }
}
