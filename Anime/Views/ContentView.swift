//
//  ContentView.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimeList()
                .tabItem {
                    Label("Anime List", systemImage: "play.house")
                }
            AnimeListCore()
                .tabItem {
                    Label("Anime List Core", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
