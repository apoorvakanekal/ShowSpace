//
//  ShowData.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/26/23.
//

import Foundation

struct Show: Codable, Identifiable {
    var id: Int
    var name: String
    var genres: [String]
    var premiered: Date
    var rating: Rating
    var image: Photo
    var summary: String
}

struct Rating: Codable{
    var average: Double?
}

struct Photo : Codable{
    var medium: String
}

struct ShowState: Codable, Identifiable, Equatable{
    var id: Int
    var isAddedToList: Bool
    var isAddedToAllStars: Bool
    var isCurrentlyWatching: Bool
}

struct UserRating: Codable {
    var rating: Double
}
