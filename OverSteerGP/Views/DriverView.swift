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
            Section(header: Text(driver.name)) {
                HStack() {
                    Image(driver.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10) // Set corner radius for border
                                .stroke(Color.black, lineWidth: 1) // Add border with black color and 1pt width
                        )
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(driver.name)
                        Image(driver.image)
                        Text(driver.country)
                    }
                }
                .padding(0)
                
            }
            Section(header: Text("Driver Information")) {
                Text("First Race \(driver.first_entry)")
            }
        }
    }
}

//#Preview {
//    DriverView()
//}
