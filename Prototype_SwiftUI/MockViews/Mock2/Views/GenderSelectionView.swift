//
//  GenderSelectionView.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import SwiftUI

struct GenderSelectionView: View {
    @Binding var isGenderMale: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: { isGenderMale = true }, label: {
                Label("Male",
                      systemImage: "person.fill")
                    .foregroundColor(isGenderMale ? .blue : .gray)
            })
            Button(action: { isGenderMale = false }, label: {
                Label("Female",
                      systemImage: "person")
                    .foregroundColor(isGenderMale ? .gray : .red)
            })
        }
    }
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView(isGenderMale: .constant(false))
    }
}
