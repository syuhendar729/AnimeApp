//
//  Anime.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import Foundation
import SwiftUI

struct Anime: Hashable, Codable {
    var id: Int
    var title: String
    var rating: Double
    var episode: Int
    var genre: [String]
    var sinopsis: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

struct AnimeDummy: Hashable, Codable {
    let title: String?
    let rating: String?
    let episode: Int
    let genre: String?
    let sinopsis: String?
    let isFavorite: Bool
    let realaseDate: Date?
}

// Sample Data
let animesSampleData = [
    AnimeDummy(title: "Judul Anime 1", rating: "8.0", episode: 12, genre: "Drama, Romance", sinopsis: "Menceritakan seseorang yang blablablabla", isFavorite: false, realaseDate: Date()),
    AnimeDummy(title: "Judul Anime 2", rating: "8.0", episode: 12, genre: "Drama, Romance", sinopsis: "Menceritakan seseorang yang blablablabla", isFavorite: false, realaseDate: Date()),
    AnimeDummy(title: "Judul Anime 3", rating: "8.0", episode: 12, genre: "Drama, Romance", sinopsis: "Menceritakan seseorang yang blablablabla", isFavorite: true, realaseDate: Date()),
    AnimeDummy(title: "Judul Anime 4", rating: "8.0", episode: 12, genre: "Drama, Romance", sinopsis: "Menceritakan seseorang yang blablablabla", isFavorite: true, realaseDate: Date())
]
