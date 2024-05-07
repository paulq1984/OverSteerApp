//
//  Driver.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-04-26.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Driver: Codable {
    var id: Int
    var name: String
    var first_entry: String
    var first_win: String?
    var country: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case first_entry
        case first_win
        case country
        case image
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.first_entry = try container.decode(String.self, forKey: .first_entry)
        self.first_win = try container.decode(String.self, forKey: .first_win)
        self.country = try container.decode(String.self, forKey: .country)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.first_entry, forKey: .first_entry)
        try container.encode(self.first_win, forKey: .first_win)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.image, forKey: .image)
    }
}

//{
//    "id": 10,
//    "name": "Pierre Gasly",
//    "first_entry": "2017 Malaysian Grand Prix",
//    "first_win": "2020 Italian Grand Prix",
//    "team" : "BWT Alpine F1 Team",
//    "country": "FRA",
//    "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/2022_French_Grand_Prix_%2852279065728%29_%28cropped%29.png/440px-2022_French_Grand_Prix_%2852279065728%29_%28cropped%29.png"
//   }
