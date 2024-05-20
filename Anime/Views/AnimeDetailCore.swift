//
//  AnimeDetailCore.swift
//  Anime
//
//  Created by Syuhada Rantisi on 17/05/24.
//

import SwiftUI

struct AnimeDetailCore: View {
    var anime: AnimeData
//    var anime: AnimeDummy
    @State private var isPresentingAddAnimeSheet = false

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Title :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(anime.title ?? "no title")
                }
                HStack {
                    Text("Rating :")
                        .fontWeight(.bold)
                    Text(anime.rating ?? "no rate")
                }
                HStack {
                    Text("Episode :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(anime.episode)")
                }
                HStack {
                    Text("Genre :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(anime.genre!)
                }
                HStack {
                    Text("Realase Date :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("\(anime.realaseDate ?? Date(), formatter: dateFormatter)")
                    
                }
                Section {
                    Text("Sinopsis :")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(anime.sinopsis!)
                }
            }
            .toolbar {
                Button(action: {
                    isPresentingAddAnimeSheet = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
            }
        }
        .sheet(isPresented: $isPresentingAddAnimeSheet) {
            AddAnimeSheet(anime: anime, isPresented: $isPresentingAddAnimeSheet)
        }
    }
}

//#Preview {
//    let anime1: AnimeDummy = AnimeDummy(title: "Judul Anime", rating: "8.0", episode: 12, genre: "Drama, Romance", sinopsis: "Loid Forge atau Twilight, seorang mata-mata yang bekerja untuk organisasi rahasia. Loid dikenal sebagai salah satu mata-mata yang selalu berhasil menyelesaikan misinya. Suatu hari, Loid diberikan tugas oleh atasannya untuk membentuk sebuah keluarga palsu. \n\nTujuannya yakni guna mendekati Desmon Donovan, Pemimpin dari Partai Nasional. Untuk mewujudkan misi tersebut, Loid mengunjungi Panti Asuhan dan memilih mengadopsi seorang anak perempuan bernama Anya. \n\nSetelah mengadopsi seorang anak, Loid diharuskan mencari seorang istri. Untuk itu, Yor, salah satu wanita yang bekerja di pemerintahaan bersedia membuat keluarga palsu dengan Loid. Sekarang, apakah misi dari Loid akan berhasil?", isFavorite: false, realaseDate: Date())
//    return AnimeDetailCore(anime: anime1)
//}

