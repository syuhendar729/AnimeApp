//
//  ModelData.swift
//  Anime
//
//  Created by Syuhada Rantisi on 11/05/24.
//

import Foundation

@Observable
class ModelData {
    var animes: [Anime] = load(_filename: "animeData.json")
}
// TROUBLESHOOT: harus mendeklarasikan filename dan memberikan parameter _filename di load()
//var animes: [Anime] = load(_filename: filename)
var filename = "animeData.json"

func load<T: Decodable>(_filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't file \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
