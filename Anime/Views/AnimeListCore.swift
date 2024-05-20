//
//  AnimeListCore.swift
//  Anime
//
//  Created by Syuhada Rantisi on 17/05/24.
//

import SwiftUI

struct AnimeListCore: View {
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var showFavoritesOnly = false
    @State private var isPresentingAddAnimeSheet = false
    
    // MARK: Core Data View Variable
    @FetchRequest(sortDescriptors: []) private var animes: FetchedResults<AnimeData>
    // From Sample Data
//    var animes: [AnimeDummy] = animesSampleData
    
    var filteredAnimes: [AnimeData] {
//    var filteredAnimes: [AnimeDummy] {
        animes.filter { anime in
            (!showFavoritesOnly || anime.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {

            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites Only")
                })
                
                ForEach(filteredAnimes, id: \.self) { anime in
                    NavigationLink(destination: AnimeDetailCore(anime: anime)) {
                        HStack {
                            Text(anime.title ?? "no title")
                            Spacer()
                            if anime.isFavorite {
                                Image(systemName: "star.fill")
                            }
                                    
                        }
                    }
                }
                .onDelete(perform: delete)

            }
            .navigationTitle("Anime List Core")
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
            AddAnimeSheet(isPresented: $isPresentingAddAnimeSheet)
        }
        
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let anime = animes[index]
            // MARK: Core Data Operations
            self.viewContext.delete(anime)

            do {
                try viewContext.save()
                print("perform delete")
            } catch {
                // handle the Core Data error
            }
        }
    }
}


#Preview {
    AnimeListCore()
}


