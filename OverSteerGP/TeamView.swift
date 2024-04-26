//
//  TeamView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-04-12.
//

import SwiftUI
import SwiftData

struct TeamView: View {
    @Environment(\.modelContext) var modelContext
    let team: Team
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    Color(team.colors[0])
                )
                .frame(height: geometry.size.height / 2)
                .overlay(
                    VStack(alignment: .leading) {
                        Text(team.name).bold()
                            .font(.title)
                            .foregroundColor(Color(team.colors[1]))
                            
                        Spacer()
                        HStack {
                            Text("Flag")
                            Spacer()
                            Text("Car")
                        }
                    }
                        .padding()
                    
                )
        }
    }
}
