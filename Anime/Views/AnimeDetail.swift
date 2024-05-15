//
//  AnimeDetail.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

struct AnimeDetail: View {
    @Environment(ModelData.self) var modelData
    
    var anime: Anime
    
    var animeIndex: Int {
        modelData.animes.firstIndex(where: { $0.id == anime.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            ImageView(image: anime.image)
                .offset(y: -130)
                .padding(.bottom, -130)
                .padding(.top, 130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Judul       :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(anime.title)
                }
                HStack {
                    Text("Rating     :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(anime.rating)")
                }
                HStack {
                    Text("Episode  :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(anime.episode)")
                }
                HStack {
                    Text("Genre      :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
                HStack {
                    ForEach(anime.genre, id: \.self) { genre in
                            Text(genre)
                    }
                }
                HStack {
                    Text("Sinopsis :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 3)
                Text(anime.sinopsis)
                    .padding(.top, 2)
                
            }
            .padding(30)
        }
//        TROUBLESHOOT: Penyebab <Anime List jadi <Back karna titlenya kepanjangan
        .navigationTitle("Anime Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            FavoriteButton(isSet: $modelData.animes[animeIndex].isFavorite)
        }
    }
}

#Preview {
//    let modelData = ModelData()
    AnimeDetail(anime: ModelData().animes[0])
        .environment(ModelData())
}
