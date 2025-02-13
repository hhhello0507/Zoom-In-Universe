import SwiftUI

struct IconButton: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.white)
                .frame(width: 28, height: 28)
                .padding(6)
                .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
        }
        .scaledButtonStyle()
    }
}
