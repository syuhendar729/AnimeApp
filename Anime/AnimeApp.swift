//
//  AnimeApp.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

@main
struct AnimeApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
