//
//  MockScreenTwoViewModel.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 20.06.21.
//

import Foundation
import SwiftUI

enum Country: Identifiable, Hashable, CaseIterable {
    case austria, germany, switzerland
    
    var id: String { return "\(self)" }
}

final class MockScreenTwoViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var userImage: UIImage?
    @Published var isGenderMale: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var birthday: Date = Date()
    @Published var selectedCountryIndex = 0

    private(set) lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let countries = Country.allCases
    
    func makeText(from country: Country) -> String {
        switch country {
        case .austria:
            return "Austria"
        case .germany:
            return "Germany"
        case .switzerland:
            return "Switzerland"
        }
    }
    
    func register() {
        
    }
}
