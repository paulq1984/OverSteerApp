//
//  RacesView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import SwiftUI
import SwiftData

struct RacesView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \RaceModel.title, order: .forward) private var races: [RaceModel]
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(races) { race in
                            HStack() {
                                Text(race.title)
                            }
                        }
                }
            }
            .navigationTitle("Races")
        }
    }
}

//#Preview {
//    RacesView()
//}
