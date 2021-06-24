//
//  MockScreenTwo.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import SwiftUI

struct MockScreenTwo: View {
    @ObservedObject var viewModel = MockScreenTwoViewModel()
    
    @State private var countryPickerShown = false
    @State private var datePickerShown = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderInputView(firstName: $viewModel.firstName,
                            lastName: $viewModel.lastName,
                            userImage: $viewModel.userImage)
            GenderSelectionView(isGenderMale: $viewModel.isGenderMale)
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            
            DatePickerWrapperView(dateFormatter: viewModel.dateFormatter.string(from:),
                                  text: "Birthday",
                                  date: $viewModel.birthday,
                                  isFocussingDatePicker: $datePickerShown)
            PickerWrapperView(title: "Countries",
                              data: viewModel.countries,
                              pickerIsShown: $countryPickerShown,
                              selectedIndex: $viewModel.selectedCountryIndex) { country in
                return Text(viewModel.makeText(from: country))
            }
            Spacer()

            Button("Join") {
                viewModel.register()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(.all, 16)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct MockScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        MockScreenTwo()
    }
}
