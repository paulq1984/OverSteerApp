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
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(teams, id:\.self) { team in
                        NavigationLink(value: team) {
                            Image(team.logo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10) // Set corner radius for border
                                        .stroke(Color.black, lineWidth: 1) // Add border with black color and 1pt width
                                )
                        }
                        
                    }
                }
                .padding(10)
            }
            .navigationTitle("Teams")
            .navigationDestination(for: TeamModel.self) { team in
                TeamView(team: team)
            }
        }
    }
}

//#Preview {
//    TeamListView()
//}
