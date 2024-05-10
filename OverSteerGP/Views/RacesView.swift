//
//  RacesView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import SwiftUI
import SwiftData

struct RacesView: View {
    let race: RaceModel
    
    //get drivers for poduim
    
    var body: some View {
            List {
                Section() {
                    VStack(spacing: 10) {
                        HStack(alignment: .center) {
                            Text(race.title)
                            Spacer()
                            Image(race.countryShort)
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
                        .padding(.top)
                        HStack() {
                            Image(race.map)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                        }
                    }
                }
                Section() {
                    if(race.completed) {
                        Text("PODUIM")
                    } else {
                        Text(race.dates)
                    }
                    
                }
                Section() {
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("\(race.firstGP)")
                            Spacer()
                            Text("\(race.laps)")
                        }
                        HStack() {
                            Text("\(race.circuitLength)")
                            Spacer()
                            Text("\(race.raceDistance)")
                        }
                        HStack() {
                            Text(race.lapRecordtime)
                            Text(race.lapRecorddriver)
                            Text("\(race.lapRecordyear)")
                        }
                    }
                }
                
            }
            .navigationTitle("\(race.countryFull) GP")
    }
}

//#Preview {
//    RacesView()
//}
