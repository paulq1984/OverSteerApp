//
//  RaceLoader.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import Foundation

struct Race: Decodable {
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
}

struct RaceLoader {
    func loadRaces() async throws -> [Race] {
        guard let url = URL(string: "https://raw.githubusercontent.com/paulq1984/OverSteerGP_Data/main/races.json") else { return []}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpReponse = response as? HTTPURLResponse,
              httpReponse.statusCode == 200
        else { return []}
        
        let races = try JSONDecoder().decode([Race].self, from: data)
        return races
    }
}
