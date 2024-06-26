//
//  DataImporter.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import Foundation
import SwiftData

struct DataImporter {
    let context: ModelContext
    let teamLoader: TeamLoader
    let driverLoader: DriverLoader
    let raceLoader: RaceLoader
    

    func importTeamsData() async throws {
        
        var teamsDescriptor = FetchDescriptor<TeamModel>()
        teamsDescriptor.fetchLimit = 1
        let persistedTeams = try context.fetch(teamsDescriptor)
        
        if persistedTeams.isEmpty {
            let teams = try await teamLoader.loadTeams()
            if !teams.isEmpty {
                teams.forEach{ team in
                    let teamModel = TeamModel(id: team.id, name: team.name, logo: team.logo, constructor: team.constructor, chassis: team.chassis, power_unit: team.power_unit, base: team.base, tp: team.tp, team_url: team.team_url, drivers: team.drivers, colors: team.colors, tc: team.tc, first_entry: team.first_entry)
                    context.insert(teamModel)
                }
            }
        }
        
    }
    
    func importDriversData() async throws {
        var driversDescriptor = FetchDescriptor<DriverModel>()
        driversDescriptor.fetchLimit = 1
        let persistedDrivers = try context.fetch(driversDescriptor)
        
        if persistedDrivers.isEmpty {
            let drivers = try await driverLoader.loadDrivers()
            if !drivers.isEmpty {
                drivers.forEach { driver in
                    let driverModel = DriverModel(id: driver.id, name: driver.name, first_entry: driver.first_entry, team: driver.team, country: driver.country, image: driver.image, colors: driver.colors)
                    context.insert(driverModel)
                }
            }
        }
    }
    
    func importRacesData() async throws {
        var racesDescriptor = FetchDescriptor<RaceModel>()
        racesDescriptor.fetchLimit = 1
        let persistedRaces = try context.fetch(racesDescriptor)
        
        if persistedRaces.isEmpty {
            let races = try await raceLoader.loadRaces()
            if !races.isEmpty {
                races.forEach { race in
                    let raceModel = RaceModel(id: race.id, title: race.title, countryShort: race.countryShort, countryFull: race.countryFull, completed: race.completed, city: race.city, track: race.track, firstGP: race.firstGP, laps: race.laps, circuitLength: race.circuitLength, raceDistance: race.raceDistance, lapRecordtime: race.lapRecordtime, lapRecorddriver: race.lapRecorddriver, lapRecordyear: race.lapRecordyear, dates: race.dates, map: race.map)
                    context.insert(raceModel)
                }
            }
        }
    }
    
}
