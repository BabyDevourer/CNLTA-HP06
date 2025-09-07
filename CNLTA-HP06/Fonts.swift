//
//  Fonts.swift
//  CNLTA-HP06-Final-PhotoBook
//
//  Created by Tony Phan on 17/8/25.
//
import SwiftUI

struct FontOption: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let makeFont: (CGFloat) -> Font

    static func == (lhs: FontOption, rhs: FontOption) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

/// A small curated set that exists on all iOS versions
let defaultFontOptions: [FontOption] = [
    .init(name: "System Bold") { size in .system(size: size, weight: .bold) },
    .init(name: "Rounded")     { size in .system(size: size, weight: .bold, design: .rounded) },
    .init(name: "Serif")       { size in .system(size: size, weight: .bold, design: .serif) },
    .init(name: "Monospaced")  { size in .system(size: size, weight: .bold, design: .monospaced) },
    // A couple of classic Apple fonts that are usually present
    .init(name: "Avenir Next") { size in .custom("AvenirNext-DemiBold", size: size) },
    .init(name: "Marker Felt") { size in .custom("MarkerFelt-Wide", size: size) }
]

#Preview {
    List(defaultFontOptions) { option in
        Text(option.name)
            .font(option.makeFont(18))
    }
}
