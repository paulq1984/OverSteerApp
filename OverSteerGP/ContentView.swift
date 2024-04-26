//
//  ContentView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-04-12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var teams: [Team]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(teams, id: \.id) { team in
                    NavigationLink{
                        TeamView(team: team)
                    } label: {
                        Text(team.name)
                    }
                    
                }
            }
        }
        .task {
            await downloadJson()
        }
        .padding()
    }
}

extension ContentView {
    func downloadJson() async {
        guard let url = URL(string: "https://github.com/paulq1984/OverSteerGP_Data/raw/main/teams.json") else {
            fatalError("Invalid URL.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if teams.isEmpty {
                guard let decodedResponse = try? decoder.decode([Team].self, from: data) else {
                    fatalError("Failed to decode data")
                }
                try? modelContext.delete(model: Team.self)
                for team in decodedResponse {
                    modelContext.insert(team)
                }
            }
        }
        catch {
            fatalError("Failed to decode data.")
        }
    }
}

#Preview {
    ContentView()
}
