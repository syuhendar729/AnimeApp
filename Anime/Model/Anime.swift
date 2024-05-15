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

