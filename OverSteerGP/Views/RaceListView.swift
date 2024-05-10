//
//  RaceListView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-10.
//

import SwiftUI
import SwiftData

struct RaceListView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \RaceModel.id, order: .forward) private var races: [RaceModel]
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(races) { race in
                        NavigationLink(value: race) {
                            HStack() {
                                Text(race.title)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Races")
            .navigationDestination(for: RaceModel.self) {race in
                RacesView(race: race)
            }
        }
    }
}

//#Preview {
//    RaceListView()
//}
