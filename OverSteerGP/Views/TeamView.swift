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
    let screen = UIScreen.main.bounds
    
    var body: some View {
        List {
            Section(){
                VStack(spacing: 20) {
                    HStack {
                        Divider()
                            .frame(width: 5, height: 20)
                            .overlay(Color(team.colors))
                        Text(team.name)
                        Spacer()
                        Image(team.base)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 30)
                            .clipped()
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5) // Set corner radius for border
                                    .stroke(Color.black, lineWidth: 1) // Add border with black color and 1pt width
                            )
                    }
                    Image(team.chassis)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            Section() {
                ForEach(filteredDrivers) { driver in
                    NavigationLink(value: driver) {
                        HStack() {
                            Image("\(driver.id)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                            Divider()
                                .frame(width: 5, height: 20)
                                .overlay(Color(team.colors))
                            Text(driver.name)
                        }
                    }
                }
            }
            Section() {
                Text("TEAM INFO")
            }
        }
        .navigationTitle(team.name)
        .navigationDestination(for: DriverModel.self) { driver in
            DriverView(driver: driver)
        }
    }
}

//#Preview {
//    TeamView()
//}
