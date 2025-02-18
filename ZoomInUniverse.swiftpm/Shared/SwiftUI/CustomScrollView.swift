//
//  CustomScrollView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/18/25.
//

import SwiftUI

struct CustomScrollView<C: View>: View {
    @Binding private var scrollViewProxy: ScrollViewProxy?
    private let alignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let reversed: Bool
    private let content: () -> C
    
    init(
        scrollViewProxy: Binding<ScrollViewProxy?>,
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = nil,
        reversed: Bool = false,
        @ViewBuilder content: @escaping () -> C
    ) {
        self._scrollViewProxy = scrollViewProxy
        self.alignment = alignment
        self.spacing = spacing
        self.reversed = reversed
        self.content = content
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            if reversed {
                ScrollView {
                    LazyVStack(
                        alignment: alignment,
                        spacing: spacing
                    ) {
                        content()
                    }
                    .rotationEffect(Angle(degrees: 180))
                    .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
                    .onAppear {
                        self.scrollViewProxy = proxy
                    }
                }
                .rotationEffect(Angle(degrees: 180))
                .scaleEffect(x: -1.0, y: 1.0, anchor: .center)
            } else {
                ScrollView {
                    LazyVStack(
                        alignment: alignment,
                        spacing: spacing,
                        content: content
                    )
                    .onAppear {
                        self.scrollViewProxy = proxy
                    }
                }
            }
        }
    }
}
