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
        Text(driver.name)
    }
}

//#Preview {
//    DriverView()
//}
