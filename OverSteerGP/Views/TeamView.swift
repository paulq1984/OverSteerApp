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
        List {
            Section(header: Text(team.name)) {
                VStack(alignment: .center) {
                    HStack(){
                        Text("2024 \(team.constructor)")
                        Spacer()
                        Text(team.base)
                    }
                    Image(team.chassis)
                }
            }
            .headerProminence(.increased)
            Section(header: Text("Drivers")) {
                ForEach(filteredDrivers) { driver in
                    NavigationLink(value: driver) {
                        HStack {
                            AsyncImage(url: URL(string: driver.image)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.red
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(.rect(cornerRadius: 10))
                            Text(driver.name)
                        }
                        
                    }
                }
            }
            .headerProminence(.increased)
            Section(header: Text("Team Information")) {
                VStack(alignment: .leading){
                    Text("Name: \(team.name)")
                    Text("Team Principal: \(team.tp)")
                    Text("Current Chassis: \(team.chassis)")
                    Text("Current Power Unit: \(team.power_unit)")
                }
            }
            .headerProminence(.increased)
        }
        .listStyle(.insetGrouped)
        .navigationDestination(for: DriverModel.self) { driver in
            DriverView(driver: driver)
        }
        .navigationTitle("Team Information")
    }
}

//#Preview {
//    TeamView()
//}
