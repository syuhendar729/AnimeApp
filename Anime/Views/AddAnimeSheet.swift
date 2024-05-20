//
//  AddAnimeSheet.swift
//  Anime
//
//  Created by Syuhada Rantisi on 16/05/24.
//

import SwiftUI

struct AddAnimeSheet: View {
    // MARK: Core Data Variables
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @State var anime: AnimeData?
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    @State private var rating: String = ""
    @State private var episode: Int = 0
    @State private var genre: String = ""
    @State private var sinopsis: String = ""
    @State private var isFavorite: Bool = false
    @State private var realaseDate: Date = Date()

    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Anime Info:")) {
                    HStack {
                        Text("Title     :")
                        TextField("Judul Anime", text: $title)
                    }
                    HStack {
                        Text("Genre  :")
                        TextField("Genre", text: $genre)
                    }                    
                    HStack {
                        Text("Rating  :")
                        TextField("Rating", text: $rating)
                    }
                    
                    
                }
                
                Section {
                    HStack {
                        Text("Episode : ")
                        Stepper("\(episode)", value: $episode)
                    }
                    DatePicker(
                        "Realase Date : ",
                        selection: $realaseDate,
                        displayedComponents: [.date]
                    )
                    Toggle(isOn: $isFavorite) {
                        Text("Add to Favorite")
                    }
                }

                Section {
                    VStack(alignment: .leading) {
                        Text("Sinopsis : ")
                        TextField("Blablabla", text: $sinopsis, axis: .vertical)
                            .padding(3)
                    }
                        
                }

            }
            .toolbar {
                Button(action: {
                    isPresented = false
                }, label: {
                    Text("Cancel")
                })
                                    
                Button(action: {
                    saveAnime()
                    isPresented = false
                }, label: {
                    Text("Save")
                })
                .buttonStyle(.borderedProminent)
            }
            .onAppear {
                if let anime = anime {
                    self.title = anime.title!
                    self.genre = anime.genre!
                    self.rating = anime.rating!
                    self.episode = Int(anime.episode)
                    self.realaseDate = anime.realaseDate!
                    self.isFavorite = anime.isFavorite
                    self.sinopsis = anime.sinopsis!
                }
            }

        }
       
    }
    
    // MARK: Core Data Operations
    func saveAnime() {
        if anime == nil {
            anime = AnimeData(context: self.viewContext)
            anime?.id = UUID()
        }
        anime?.title = title
        anime?.genre = genre
        anime?.rating = rating
        anime?.episode = Int16(episode)
        anime?.realaseDate = realaseDate
        anime?.isFavorite = isFavorite
        anime?.sinopsis = sinopsis
        
        do {
            try self.viewContext.save()
            print("Anime saved successfully!")
        } catch {
            print("Whoops \\(error.localizedDescription)")
        }
    }
    
}

#Preview {
    AddAnimeSheet(isPresented: .constant(true))
}
