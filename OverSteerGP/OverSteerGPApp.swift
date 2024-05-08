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
    
    let container = try! ModelContainer(for: TeamModel.self, DriverModel.self)
    let teamLoader = TeamLoader()
    let driverLoader = DriverLoader()
    
    let dataImporter: DataImporter
    
    init() {
        self.dataImporter = DataImporter(context: container.mainContext, teamLoader: teamLoader, driverLoader: driverLoader)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        try await dataImporter.importTeamsData()
                        try await dataImporter.importDriversData()
                    } catch {
                        print(error)
                    }
                    
                }
        }.modelContainer(container)
    }
}
