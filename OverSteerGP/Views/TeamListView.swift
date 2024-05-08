//
//  TeamListView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import SwiftUI
import SwiftData

struct TeamListView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \TeamModel.name, order: .forward) private var teams: [TeamModel]
    
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
            .navigationDestination(for: TeamModel.self) { team in
                    TeamView(team: team)
            }
        }
    }
}

//#Preview {
//    TeamListView()
//}
