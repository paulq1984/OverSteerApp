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
                        Text(team.constructor)
                        Spacer()
                        Image(team.base)
                    }
                    Image(team.chassis)
                }
            }
            Section(header: Text("Drivers")) {
                ForEach(filteredDrivers) { driver in
                    NavigationLink(value: driver) {
                        HStack {
                            Image("\(driver.id)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                            Divider()
                                .frame(width: 5, height: 20)
                                .overlay(Color(team.colors[0]))
                            Text(driver.name)
                        }
                        
                    }
                }
            }
            
            Section(header: Text("Team Information")) {
                VStack(alignment: .leading){
                    Text("Name: \(team.name)")
                    Text("First Entry: \(team.first_entry)")
                    Text("Team Principal: \(team.tp)")
                    Text("Techincal Chief: \(team.tc)")
                    Text("Current Chassis: \(team.chassis)")
                    Text("Current Power Unit: \(team.power_unit)")
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Team Info")
        .navigationDestination(for: DriverModel.self) { driver in
            DriverView(driver: driver)
        }
    }
}

//#Preview {
//    TeamView()
//}
