import SwiftUI

enum HandHelperType {
    case zoomInOutHand
    case moveHand
    
    var image: Images {
        switch self {
        case .zoomInOutHand:
                .zoomInOutHand
        case .moveHand:
                .moveHand
        }
    }
    
    var description: String {
        switch self {
        case .zoomInOutHand:
            "Zoom in and out to explore"
        case .moveHand:
            "Move and explore in 3D"
        }
    }
}

private struct HandHelperModifier: ViewModifier {
    private let type: HandHelperType
    @State private var opacity = 1.0
    
    init(type: HandHelperType) {
        self.type = type
    }
    
    func body(content: Content) -> some View {
        content.overlay {
            Group {
                Color.black.opacity(0.7)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Image(type: type.image)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.foreground)
                        .frame(width: 100)
                    Text(type.description)
                        .font(.body)
                }
            }
            .opacity(opacity)
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            withAnimation(.easeIn(duration: 1)) {
                opacity = 0
            }
        }
    }
}

extension View {
    func handHelper(for type: HandHelperType) -> some View {
        self.modifier(HandHelperModifier(type: type))
    }
}
