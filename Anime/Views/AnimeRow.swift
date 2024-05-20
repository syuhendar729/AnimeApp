//
//  AnimeRow.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import SwiftUI

struct AnimeRow: View {
    var anime: Anime
    var body: some View {
        HStack {
            anime.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(anime.title)
            Spacer()
            if anime.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
    
}

#Preview {
    let animes = ModelData().animes
    return Group {
        AnimeRow(anime: animes[0])
        AnimeRow(anime: animes[1])
        AnimeRow(anime: animes[2])
    }
}

