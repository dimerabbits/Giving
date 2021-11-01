//
//  View-GiveButton.swift.swift
//  Giving
//
//  Created by Adam Herring on 11/1/21.
//

import SwiftUI

extension View {
    func giveButton() -> some View {
        modifier(GiveButton())
    }
}

struct GiveButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3.bold())
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color.accentColor.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct View_GiveButton_swift_Previews: PreviewProvider {
    static var previews: some View {
        Button("Preview") {}
        .giveButton()
    }
}
