//
//  TeamListView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

struct TeamListView: View {
    @Environment(\.modelContext) private var context
    
    let teams: [Team]
    
    var body: some View {
        List {
            ForEach(teams) { team in
                HStack {
                    Text(team.name)
                }
            }
        }
    }
}

#Preview {
    TeamListView(teams: [])
        .modelContainer(for: [Team.self])
}
