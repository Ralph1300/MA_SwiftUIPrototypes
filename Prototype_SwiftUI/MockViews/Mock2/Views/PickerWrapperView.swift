//
//  PickerWrapperView.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import SwiftUI

struct PickerWrapperView<T: Identifiable & Hashable, Content: View>: View {
    let title: String
    let data: [T]
    @Binding var pickerIsShown: Bool
    // the swiftui picker has an obvious limitation - it can only bind to Int (an index)
    // otherwise, the binding won't be updated.
    @Binding var selectedIndex: Int
    let bodyProvider: (T) -> Content
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text(title)
                Spacer()
                Button(action: { pickerIsShown.toggle() }, label: {
                    bodyProvider(data[selectedIndex])
                })
            }
            if pickerIsShown {
                Picker(title, selection: $selectedIndex) {
                    ForEach(0..<data.endIndex) { index in
                        bodyProvider(data[index])
                    }
                }
                .labelsHidden()
            }
        }
    }
}
