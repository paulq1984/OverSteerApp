//
//  Driver.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import Foundation
import SwiftData

@Model
class DriverModel {
    var id: Int
    var name: String
    var first_entry: String
    var first_win: String?
    var team: String
    var country: String
    var image: String
    var colors: String
    
    init(id: Int, name: String, first_entry: String, first_win: String? = nil, team: String, country: String, image: String, colors: String) {
        self.id = id
        self.name = name
        self.first_entry = first_entry
        self.first_win = first_win
        self.team = team
        self.country = country
        self.image = image
        self.colors = colors
    }
}






//"id": 10,
//"name": "Pierre Gasly",
//"first_entry": "2017 Malaysian Grand Prix",
//"first_win": "2020 Italian Grand Prix",
//"team" : "BWT Alpine F1 Team",
//"country": "FRA",
