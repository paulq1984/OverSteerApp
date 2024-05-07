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
        TeamListView(teams: teams)
    }
}

#Preview {
    TeamsListScreen()
}
