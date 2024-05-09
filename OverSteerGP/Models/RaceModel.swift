//
//  RaceModel.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import Foundation
import SwiftData

@Model
class RaceModel {
    var id: Int
    var title: String
    var countryShort: String
    var countryFull: String
    var completed: Bool
//    var pole: Int?
//    var winner: Int?
//    var second: Int?
//    var third: Int?
//    var fastestLap: Int?
    
    init(id: Int, title: String, countryShort: String, countryFull: String, completed: Bool) {
        self.id = id
        self.title = title
        self.countryShort = countryShort
        self.countryFull = countryFull
        self.completed = completed
    }
}
