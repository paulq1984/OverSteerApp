//
//  ContentView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var teams: [Team]
    
    var body: some View {
        List(teams) { team in
            Text(team.name)
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
