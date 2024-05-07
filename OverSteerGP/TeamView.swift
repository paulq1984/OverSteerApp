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
            RoundedRectangle(cornerRadius: 20.0)
                .fill(
                    Color(team.colors[0])
                )
                .frame(height: geometry.size.height / 2)
                .overlay(
                    VStack(alignment: .leading) {
                        Text(team.name).bold()
                            .font(.title)
                            .foregroundColor(Color(team.colors[1]))
                        Image(team.logo)
                        Spacer()
                        HStack {
                            Image(team.base)
                            Spacer()
                            Image(team.chassis)
                        }
                    }
                        .padding()
                    
                )
        }
    }
}
