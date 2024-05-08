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
    

    func importTeamsData() async throws {
        
        var teamsDescriptor = FetchDescriptor<TeamModel>()
        teamsDescriptor.fetchLimit = 1
        let persistedTeams = try context.fetch(teamsDescriptor)
        
        if persistedTeams.isEmpty {
            let teams = try await teamLoader.loadTeams()
            if !teams.isEmpty {
                teams.forEach{ team in
                    let teamModel = TeamModel(id: team.id, name: team.name, logo: team.logo, constructor: team.constructor, chassis: team.chassis, power_unit: team.power_unit, base: team.base, tp: team.tp, team_url: team.team_url, drivers: team.drivers)
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
                    let driverModel = DriverModel(id: driver.id, name: driver.name, first_entry: driver.first_entry, team: driver.team, country: driver.country)
                    context.insert(driverModel)
                }
            }
        }
    }
    
}
