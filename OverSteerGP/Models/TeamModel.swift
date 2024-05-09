//
//  Team.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import Foundation
import SwiftData

@Model
class TeamModel {
    
    var id: Int
    var name: String
    var logo: String
    var constructor: String
    var chassis: String
    var power_unit: String
    var base: String
    var tp: String
    var team_url: String
    var drivers: [Int]
    var colors: [String]
    var tc: String
    var first_entry: String
    
    init(id: Int, name: String, logo: String, constructor: String, chassis: String, power_unit: String, base: String, tp: String, team_url: String, drivers: [Int], colors: [String], tc: String, first_entry: String) {
        self.id = id
        self.name = name
        self.logo = logo
        self.constructor = constructor
        self.chassis = chassis
        self.power_unit = power_unit
        self.base = base
        self.tp = tp
        self.team_url = team_url
        self.drivers = drivers
        self.colors = colors
        self.tc = tc
        self.first_entry = first_entry
    }
}
