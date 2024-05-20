//
//  AnimeData+CoreDataProperties.swift
//  Anime
//
//  Created by Syuhada Rantisi on 17/05/24.
//
//

import Foundation
import CoreData


extension AnimeData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimeData> {
        return NSFetchRequest<AnimeData>(entityName: "AnimeData")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?
    @NSManaged public var rating: String?
    @NSManaged public var episode: Int16
    @NSManaged public var genre: String?
    @NSManaged public var sinopsis: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var realaseDate: Date?

}

extension AnimeData : Identifiable {

}
