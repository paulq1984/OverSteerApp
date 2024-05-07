//
//  Team.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import Foundation
import SwiftData

@Model
class Team: Codable {
    enum CodingKeys: CodingKey {
        case id
        case name
        case logo
        case constructor
        case chassis
        case power_unit
        case base
        case tp
        case team_url
        
    }
    
    var id: Int
    var name: String
    var logo: String
    var constructor: String
    var chassis: String
    var power_unit: String
    var base: String
    var tp: String
    var team_url: String
    
    init(id: Int, name: String, logo: String, constructor: String, chassis: String, power_unit: String, base: String, tp: String, team_url: String) {
        self.id = id
        self.name = name
        self.logo = logo
        self.constructor = constructor
        self.chassis = chassis
        self.power_unit = power_unit
        self.base = base
        self.tp = tp
        self.team_url = team_url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.id = try container.decode(Int.self, forKey: .id)
        self.constructor = try container.decode(String.self, forKey: .constructor)
        self.chassis = try container.decode(String.self, forKey: .chassis)
        self.power_unit = try container.decode(String.self, forKey: .power_unit)
        self.base = try container.decode(String.self, forKey: .base)
        self.tp = try container.decode(String.self, forKey: .tp)
        self.team_url = try container.decode(String.self, forKey: .team_url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(logo, forKey: .logo)
        try container.encode(constructor, forKey: .constructor)
        try container.encode(chassis, forKey: .chassis)
        try container.encode(power_unit, forKey: .power_unit)
        try container.encode(base, forKey: .base)
        try container.encode(tp, forKey: .tp)
        try container.encode(team_url, forKey: .team_url)
    }
}
