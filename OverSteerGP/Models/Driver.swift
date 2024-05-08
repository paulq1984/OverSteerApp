//
//  Driver.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import Foundation

@Model
final class Driver: Codable {
    var id: Int
    var name: String
    var first_entry: String
    var first_win: String?
    var team: String
    var country: String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case first_entry
        case first_win
        case team
        case country
    }
    
    init(id: Int, name: String, first_entry: String, first_win: String? = nil, team: String, country: String) {
        self.id = id
        self.name = name
        self.first_entry = first_entry
        self.first_win = first_win
        self.team = team
        self.country = country
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.first_entry = try container.decode(String.self, forKey: .first_entry)
        self.first_win = try container.decode(String.self, forKey: .first_win)
        self.team = try container.decode(String.self, forKey: .team)
        self.country = try container.decode(String.self, forKey: .country)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(first_entry, forKey: .first_entry)
        try container.encode(first_win, forKey: .first_win)
        try container.encode(team, forKey: .team)
        try container.encode(country, forKey: .country)
    }
}






//"id": 10,
//"name": "Pierre Gasly",
//"first_entry": "2017 Malaysian Grand Prix",
//"first_win": "2020 Italian Grand Prix",
//"team" : "BWT Alpine F1 Team",
//"country": "FRA",
