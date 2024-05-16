//
//  AnimeList.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

struct AnimeList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    @State private var isPresentingAddAnimeSheet = false
        
    var filteredAnimes: [Anime] {
        modelData.animes.filter { anime in
            (!showFavoritesOnly || anime.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
//            TROUBLESHOOT: Argumennya harus ada id di dalam List
//            List(filteredAnimes, id: \.id) { anime in
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites Only")
                })
//              TROUBLESHOOT: Argumen ForEach harus ada id
                ForEach(filteredAnimes, id: \.self) { anime in
                    NavigationLink {
                        AnimeDetail(anime: anime)
                    } label: {
                        AnimeRow(anime: anime)
                    }
                }
            }
            .animation(.default, value: filteredAnimes)
            .navigationTitle("Anime List")
            .toolbar {
                Button(action: {
                    isPresentingAddAnimeSheet = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        } detail: {
            Text("Select a Anime")
        }
        .sheet(isPresented: $isPresentingAddAnimeSheet) {
            AddAnimeSheet()
        }
        
    }
}

#Preview {
    AnimeList()
        .environment(ModelData())
}
