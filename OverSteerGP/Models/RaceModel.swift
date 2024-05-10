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
    var pole: Int?
    var winner: Int?
    var second: Int?
    var third: Int?
    var fastestLap: Int?
    var city: String
    var track: String
    var firstGP: Int
    var laps: Int
    var circuitLength: Float
    var raceDistance: Float
    var lapRecordtime: String
    var lapRecorddriver: String
    var lapRecordyear: Int
    var dates: String
    var map: String
    
    init(id: Int, title: String, countryShort: String, countryFull: String, completed: Bool, pole: Int? = nil, winner: Int? = nil, second: Int? = nil, third: Int? = nil, fastestLap: Int? = nil, city: String, track: String, firstGP: Int, laps: Int, circuitLength: Float, raceDistance: Float, lapRecordtime: String, lapRecorddriver: String, lapRecordyear: Int, dates: String, map: String) {
        self.id = id
        self.title = title
        self.countryShort = countryShort
        self.countryFull = countryFull
        self.completed = completed
        self.pole = pole
        self.winner = winner
        self.second = second
        self.third = third
        self.fastestLap = fastestLap
        self.city = city
        self.track = track
        self.firstGP = firstGP
        self.laps = laps
        self.circuitLength = circuitLength
        self.raceDistance = raceDistance
        self.lapRecordtime = lapRecordtime
        self.lapRecorddriver = lapRecorddriver
        self.lapRecordyear = lapRecordyear
        self.dates = dates
        self.map = map
    }
}
