import SwiftUI

struct LaunchScreenView: View {
    private static let size: CGFloat = 108
    var body: some View {
        VStack(spacing: 8) {
            Image(.appIcon)
                .resizable()
                .frame(width: Self.size, height: Self.size)
                .clipShape(RoundedRectangle(cornerRadius: Self.size / 4, style: .continuous))
            Text("Zoom In Universe")
                .font(.footnote)
                .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
