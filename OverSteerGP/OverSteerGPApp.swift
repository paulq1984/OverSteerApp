//
//  OverSteerGPApp.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-04-12.
//
import SwiftData
import SwiftUI

@main
struct OverSteerGPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Team.self)
    }
}
