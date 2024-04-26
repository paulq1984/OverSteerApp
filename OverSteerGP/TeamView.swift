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
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("02192B"), Color("#2173B8")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
                .frame(height: geometry.size.height / 2)
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.white.opacity(0.2))
                        .frame(width: .infinity, height: 100)
                        .overlay(
                            Text("Team Name").bold()
                                .font(.largeTitle)
                        )
                        .padding()
                )
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    TeamView()
}
