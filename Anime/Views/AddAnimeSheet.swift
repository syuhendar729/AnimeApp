//
//  AddAnimeSheet.swift
//  Anime
//
//  Created by Syuhada Rantisi on 16/05/24.
//

import SwiftUI

struct AddAnimeSheet: View {
    @State private var title: String = ""
    @State private var rating: Float = 0.0
    @State private var episode: Int = 0
    @State private var genre: String = ""
    @State private var sinopsis: String = ""
    @State private var isFavorite: Bool = false
    @State private var realaseDate: Date = Date()

    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Anime Info:")) {
                    TextField("Title", text: $title)
                    TextField("Genre", text: $genre)
                    Stepper("Rating: \(rating)", value: $rating)

                }
                
                Section {
                    Stepper("Episode: \(episode)", value: $episode)
                    DatePicker(
                        "Realase Date",
                        selection: $realaseDate,
                        displayedComponents: [.date]
                    )
                    Toggle(isOn: $isFavorite) {
                        Text("Add to Favorite")
                    }
                }

                Section(header: Text("Sinopsis:")) {
                    TextField("Sinopsis", text: $sinopsis, axis: .vertical)
                        .padding(3)
                        
                }
            }
        }
    }
}

#Preview {
    AddAnimeSheet()
}
