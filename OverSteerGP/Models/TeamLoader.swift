//
//  TeamLoader.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import Foundation

struct Team: Decodable {
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
    var colors: String
    var tc: String
    var first_entry: String
}

struct TeamLoader {
    
    func loadTeams() async throws -> [Team] {
        guard let url = URL(string: "https://raw.githubusercontent.com/paulq1984/OverSteerGP_Data/main/teams.json") else { return [] }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else { return [] }
        
        let teams = try JSONDecoder().decode([Team].self, from: data)
        
        return teams
    }
    
}
