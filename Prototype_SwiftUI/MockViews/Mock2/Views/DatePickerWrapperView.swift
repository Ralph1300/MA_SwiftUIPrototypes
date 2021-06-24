//
//  DatePickerWrapperView.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import SwiftUI

struct DatePickerWrapperView: View {
    let dateFormatter: (Date) -> String
    let text: String
    @Binding var date: Date
    @Binding var isFocussingDatePicker: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text(text)
                Spacer()
                Button(dateFormatter(date)) {
                    isFocussingDatePicker.toggle()
                }
            }
            if isFocussingDatePicker {
                DatePicker("",
                           selection: $date,
                           displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
            }
        }
    }
}
