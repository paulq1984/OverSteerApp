//
//  ContentView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var teams: [TeamModel]
    @Query private var drivers: [DriverModel]
    
    var body: some View {
        VStack {
            Text("Teams count: \(teams.count)")
            Text("Drivers count: \(drivers.count)")
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
