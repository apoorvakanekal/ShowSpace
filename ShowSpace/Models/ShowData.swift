//
//  ShowData.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/26/23.
//

import Foundation
import SwiftUI

struct Show: Codable, Identifiable {
    var id: Int?
    var url: String?
    var name: String?
    var genres: [String]?
    var premiered: String?
    var rating: Rating?
    var image: Photo?
    var summary: String?
}

struct Rating: Codable{
    var average: Double?
}

struct Photo : Codable{
    var original: String?
}
