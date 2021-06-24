//
//  PrimaryButtonStyle.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 19.06.21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    let color: Color = .accentColor
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: 48)
            .background(configuration.isPressed ? color.opacity(0.5) : color)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
     }
}
