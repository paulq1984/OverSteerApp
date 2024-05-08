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
    let driverIDs = [10, 31]
    
    
    private var filteredDrivers: [DriverModel]
    
    var body: some View {
        VStack{
            Text(team.name)
            List {
                ForEach(filteredDrivers) { driver in
                    Text(driver.name)
                }
            }
        }
        .onAppear {
            returnDrivers(team: team)
        }
        
        
    }
}

//#Preview {
//    TeamView()
//}
