//
//  OverSteerGPApp.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

@main
struct OverSteerGPApp: App {
    
    let container = try! ModelContainer(for: TeamModel.self, DriverModel.self, RaceModel.self)
    let teamLoader = TeamLoader()
    let driverLoader = DriverLoader()
    let raceLoader = RaceLoader()
    
    let dataImporter: DataImporter
    
    init() {
        self.dataImporter = DataImporter(context: container.mainContext, teamLoader: teamLoader, driverLoader: driverLoader, raceLoader: raceLoader)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try await dataImporter.importTeamsData()
                        try await dataImporter.importDriversData()
                        try await dataImporter.importRacesData()
                    } catch {
                        print(error)
                    }
                    
                }
        }.modelContainer(container)
    }
}
