//
//  DriverView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-08.
//

import SwiftUI

struct DriverView: View {
    
    let driver: DriverModel
    
    var body: some View {
        List{
            Section() {
                VStack(spacing: 10) {
                    HStack(alignment: .center) {
                        let names = driver.name.split(separator: " ")
                        Divider()
                            .frame(width: 5, height: 40)
                            .overlay(Color(driver.colors))
                        VStack(alignment: .leading){
                            Text(String(names[0]))
                            Text(String(names[1]))
                        }
                        Spacer()
                        Image(driver.country)
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
                        VStack(alignment: .leading){
                            Text(driver.team)
                                .font(.title3)
                            Spacer()
                            Image("\(driver.id)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                        }
                        Spacer()
                        Image(driver.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .padding(-15)
                    }
                }
                
            }
            .listRowBackground(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white, Color(driver.colors)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
            Section(header: Text("Driver Information")) {
                Text("First Race \(driver.first_entry)")
            }
        }
        .navigationTitle(driver.name)
    }
}

//#Preview {
//    DriverView()
//}
