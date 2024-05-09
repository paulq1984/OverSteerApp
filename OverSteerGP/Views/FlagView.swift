//
//  FlagView.swift
//  OverSteerGP
//
//  Created by Paul Quinnell on 2024-05-09.
//

import SwiftUI

struct FlagView: View {
    let countryCode: String
    
    private func flagEmoji(countryCode: String) -> String {
        guard countryCode.count == 2 else { return countryCode }

        var flagString = ""
        for scalar in countryCode.unicodeScalars {
            let base = UnicodeScalar("A") // Directly assign the UnicodeScalar
            guard scalar.value >= base.value, scalar.value <= base.value + 25 else {
                return countryCode
            }
            let offset = 127397
            flagString.unicodeScalars.append(UnicodeScalar(base.value + scalar.value - UInt32(offset))!)
        }
        return flagString
    }
    
    var body: some View {
        Text(flagEmoji(countryCode: countryCode))
                    .font(.largeTitle)
        }
}

//#Preview {
//    FlagView()
//}
