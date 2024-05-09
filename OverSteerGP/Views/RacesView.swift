//
//  RacesView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import SwiftUI

struct RacesView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("Races")
            }
            .navigationTitle("Races")
        }
    }
}

#Preview {
    RacesView()
}
