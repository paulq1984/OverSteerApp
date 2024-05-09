//
//  DriverListView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import SwiftUI
import SwiftData

struct DriverListView: View {
    
    @Query(sort: \DriverModel.team, order: .forward) private var drivers: [DriverModel]
    
    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(drivers) { driver in
                        NavigationLink(value: driver) {
                            HStack() {
                                Image("\(driver.id)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Divider()
                                    .frame(width: 5, height: 20)
                                    .overlay(Color(driver.colors))
                                Text(driver.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Drivers")
            .navigationDestination(for: DriverModel.self) { driver in
                DriverView(driver: driver)
            }
        }
    }
}

//#Preview {
//    DriverListView()
//}
