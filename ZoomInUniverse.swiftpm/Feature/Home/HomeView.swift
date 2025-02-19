import SwiftUI

struct HomeView: View {
    @State private var selectedMode: Mode?
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 15) {
                Text("Zoom In Universe")
                    .font(.largeTitle)
                    .bold()
                Text("Explore and experience the universe with zoom-in")
                    .font(.headline)
            }
            HStack(spacing: 10) {
                ForEach(Mode.allCases, id: \.self) { mode in
                    ModeCell(mode: mode) {
                        selectedMode = mode
                    }
                    .frame(width: 512)
                }
            }
        }
        .navigationDestination(item: $selectedMode) { mode in
            switch mode {
            case .scale:
                ScaleModeView()
            }
        }
    }
}

private struct ModeCell: View {
    let mode: Mode
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 16) {
                Image(mode.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 12))
                VStack(spacing: 6) {
                    HStack {
                        Text(mode.title)
                            .font(.title3)
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Text(mode.description)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 4)
            }
            .padding(16)
            .background(.fill.opacity(0.5))
            .clipShape(.rect(cornerRadius: 18))
        }
        .scaledButtonStyle()
    }
}

#Preview {
    HomeView()
}
