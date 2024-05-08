//
//  TeamView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import SwiftUI
import SwiftData

struct TeamView: View {
    
    let team: TeamModel
    
    @Query(sort: \DriverModel.name, order: .forward) private var drivers: [DriverModel]
    
    var filteredDrivers: [DriverModel] {
        drivers.filter { team.drivers.contains($0.id)}
    }
    
    
    var body: some View {
            VStack{
                Text(team.name)
                List {
                    ForEach(filteredDrivers) { driver in // Use filteredDrivers here
                        NavigationLink(value: driver) {
                            Text(driver.name)
                        }
                    }
                }
            }
            .navigationDestination(for: DriverModel.self) { driver in
                    DriverView(driver: driver)
            }
    }
}

//#Preview {
//    TeamView()
//}
