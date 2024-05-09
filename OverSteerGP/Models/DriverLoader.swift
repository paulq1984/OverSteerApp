//
//  DriverLoader.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import Foundation

struct Driver: Decodable {
    var id: Int
    var name: String
    var first_entry: String
    var first_win: String?
    var team: String
    var country: String
    var image: String
    var colors: String
}

struct DriverLoader {
    func loadDrivers() async throws -> [Driver] {
        guard let url = URL(string: "https://raw.githubusercontent.com/paulq1984/OverSteerGP_Data/main/drivers.json") else { return []}
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpReponse = response as? HTTPURLResponse,
              httpReponse.statusCode == 200
        else { return []}
        
        let drivers = try JSONDecoder().decode([Driver].self, from: data)
        return drivers
    }
}
