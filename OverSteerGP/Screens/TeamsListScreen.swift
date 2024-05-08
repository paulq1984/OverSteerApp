//
//  TeamsListScreen.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

struct TeamsListScreen: View {
    
    @Query(sort: \Team.name, order: .forward) private var teams: [Team]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(teams, id:\.id) { team in
                    NavigationLink(value: team) {
                        Image(team.logo)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .padding()
                    }
                    
                }
            }
            .navigationDestination(for: Team.self) { team in
                    TeamView(team: team)
            }
            .navigationTitle("Teams")
        }
    }
}

#Preview {
    TeamsListScreen()
}
