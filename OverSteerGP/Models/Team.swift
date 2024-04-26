//
//  Team.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-04-12.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Team: Codable {
    var id: Int
    var name: String
    var constructor: String
    var chassis: String
    var power_unit: String
    var drivers: [Int]
    var colors: [String]
    var base: String
    var tp: String
    var test_drivers: [String]?
    var team_url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case constructor
        case chassis
        case power_unit
        case drivers
        case colors
        case base
        case tp
        case test_drivers
        case team_url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.constructor = try container.decode(String.self, forKey: .constructor)
        self.chassis = try container.decode(String.self, forKey: .chassis)
        self.power_unit = try container.decode(String.self, forKey: .power_unit)
        self.drivers = try container.decode([Int].self, forKey: .drivers)
        self.colors = try container.decode([String].self, forKey: .colors)
        self.base = try container.decode(String.self, forKey: .base)
        self.tp = try container.decode(String.self, forKey: .tp)
        self.test_drivers = try container.decode([String].self, forKey: .test_drivers)
        self.team_url = try container.decode(String.self, forKey: .team_url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.constructor, forKey: .constructor)
        try container.encode(self.chassis, forKey: .chassis)
        try container.encode(self.power_unit, forKey: .power_unit)
        try container.encode(self.drivers, forKey: .drivers)
        try container.encode(self.colors, forKey: .colors)
        try container.encode(self.base, forKey: .base)
        try container.encode(self.tp, forKey: .tp)
        try container.encode(self.test_drivers, forKey: .test_drivers)
        try container.encode(self.team_url, forKey: .team_url)
    }
    
}


//{
//  "id": 1,
//  "name": "BWT Alpine F1 Team",
//  "constructor": "Alpine-Renault",
//  "chassis": "A524",
//  "power_unit": "Renault E-Tech RE24",
//  "drivers": [
//    10, 31
//  ],
//  "colors": [
//    "#02192B", "#2173B8"
//  ],
//  "base": "FRA",
//  "tp": "Bruno Famin",
//  "test_drivers": ["Jack Doohan"],
//  "team_url": "https://www.alpine-cars.co.uk/formula-1.html",
//  "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Logo_of_alpine_f1_team_2022.png/440px-Logo_of_alpine_f1_team_2022.png"
//}
