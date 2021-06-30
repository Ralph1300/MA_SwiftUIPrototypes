//
//  Prototype_SwiftUIApp.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 19.06.21.
//

import SwiftUI

@main
struct Prototype_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MockScreenOne()
                    .tabItem { Text("Mock1") }
                MockScreenTwo()
                    .tabItem { Text("Mock2") }
                MockScreenThree()
                    .tabItem { Text("Mock3") }
                MockScreenFour()
                    .tabItem { Text("Mock4") }
            }
        }
    }
}
