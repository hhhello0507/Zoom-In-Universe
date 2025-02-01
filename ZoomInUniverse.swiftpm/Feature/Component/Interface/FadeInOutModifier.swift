import SwiftUI

private struct FadeInOutModifier: ViewModifier {
    @State private var opacity: Double
    
    private let condition: Bool
    private let animation: Animation?
    
    init(condition: Bool, animation: Animation?) {
        self.condition = condition
        self.animation = animation
        self.opacity = condition ? 1.0 : 0.0
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .animation(animation, value: opacity)
            .onChange(of: condition) {
                opacity = $0 ? 1 : 0
            }
    }
}

extension View {
    func fadeInOut(_ condition: Bool, animation: Animation?) -> some View {
        self.modifier(FadeInOutModifier(condition: condition, animation: animation))
    }
}
