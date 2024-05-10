//
//  ContentView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-07.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
            TabView {
                TeamListView()
                    .tabItem { Label("Teams", systemImage: "car.2")}
                DriverListView()
                    .tabItem { Label("Drivers", systemImage: "figure.seated.side")}
                RaceListView()
                    .tabItem { Label("Races", systemImage: "flag.checkered.2.crossed")}
            }
    }
}

//#Preview {
//    ContentView()
//}
