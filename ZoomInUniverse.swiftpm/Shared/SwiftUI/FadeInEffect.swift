//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/18/25.
//

import SwiftUI

struct FadeInEffectModifier: ViewModifier {
    @State private var offsetY: CGFloat
    @State private var opacity: Double = 0.0
    
    private let delay: Double
    
    init(delay: Double, initialOffsetY: CGFloat) {
        self.delay = delay
        self.offsetY = initialOffsetY
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .offset(y: offsetY)
            .task {
                try? await Task.sleep(for: .seconds(delay))
                withAnimation(.easeInOut(duration: 1)) {
                    offsetY = 0
                    opacity = 1
                }
            }
    }
}

extension View {
    func fadeInEffect(delay: Double = 0, initialOffsetY: CGFloat = 16) -> some View {
        self.modifier(FadeInEffectModifier(delay: delay, initialOffsetY: initialOffsetY))
    }
}
