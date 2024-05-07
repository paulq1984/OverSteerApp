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
    var body: some Scene {
        WindowGroup {
            TeamsListScreen()
        }
        .modelContainer(for: Team.self) { result in
            do {
                let container = try result.get()
                
                let descriptor = FetchDescriptor<Team>()
                let existingTeams = try container.mainContext.fetchCount(descriptor)
                guard existingTeams == 0 else { return }
                
                guard let url = Bundle.main.url(forResource: "Teams", withExtension: "json") else {
                    fatalError("Failed to load teams.json")
                }
                
                let data = try Data(contentsOf: url)
                let teams = try JSONDecoder().decode([Team].self, from: data)
                
                for team in teams {
                    container.mainContext.insert(team)
                }
            } catch {
                print("Failed to pre-seed data")
            }
        }
    }
}
