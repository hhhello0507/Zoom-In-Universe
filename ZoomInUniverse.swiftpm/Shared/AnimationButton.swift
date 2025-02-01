import SwiftUI

struct AnimationButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        return configuration.label
            .contentShape(Rectangle())  // Ensure the entire area is clickable
            .opacity(isPressed ? 0.64 : 1)
            .scaleEffect(isPressed ? 0.96 : 1)
            .animation(.easeIn(duration: 0.15), value: isPressed)
    }
}

extension View {
    func scaledButtonStyle() -> some View {
        self
            .buttonStyle(AnimationButton())
    }
}
