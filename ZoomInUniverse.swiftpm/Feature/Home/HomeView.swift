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
                }
            }
        }
        .navigationDestination(item: $selectedMode) { mode in
            switch mode {
            case .scale:
                ScaleModeView()
            case .time:
                EmptyView()
            }
        }
    }
}

private struct ModeCell: View {
    let mode: Mode
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(mode.image)
                    .resizable()
                    .aspectRatio(16 / 9, contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 6))
                VStack(spacing: 4) {
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
            }
            .padding(14)
            .background(.fill.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
        }
        .scaledButtonStyle()
    }
}

#Preview {
    HomeView()
}
