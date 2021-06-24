//
//  MockScreenOne.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 19.06.21.
//

import SwiftUI
// Total work time ~ 1h (incl. research)
struct MockScreenOne: View {
    let viewModel = MockScreenOneViewModel()
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
                .frame(height: 32)
            Image("logo")
            Spacer()
            ButtonListView(viewModel: viewModel)
            HStack {
                Text("Already have an account?")
                Button("LOG IN") {
                    viewModel.loginViaEmail()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

struct ButtonListView: View {
    let viewModel: MockScreenOneViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.fullWidthProviders) { provider in
                Button(viewModel.makeButtonTitle(for: provider)) {
                    viewModel.tapped(loginProvider: provider)
                }
            }
            HStack(spacing: 8) {
                ForEach(viewModel.wrappedWidthProviders) { provider in
                    Button(viewModel.makeButtonTitle(for: provider)) {
                        viewModel.tapped(loginProvider: provider)
                    }
                }
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MockScreenOne()
    }
}
