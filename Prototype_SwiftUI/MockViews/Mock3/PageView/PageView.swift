//
//  PageView.swift
//  Prototype_SwiftUI
//
//  Created by Ralph Schnalzenberger on 27.06.21.
//

import SwiftUI

struct PageView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
        }
    }
}
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pageCount: 2, currentIndex: .constant(1)) {
            Color.green
            Color.red
        }
    }
}
