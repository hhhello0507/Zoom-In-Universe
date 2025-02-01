import SwiftUI

struct HomeView: View {
    @State private var selectedMode: Mode?
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(Mode.allCases, id: \.self) { mode in
                    ModeCell(mode: mode) {
                        selectedMode = mode
                    }
                    .padding(.horizontal, 15)
                }
            }
        }
        .navigationTitle("Home")
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
                Color.gray.opacity(0.3)
                    .frame(height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                HStack {
                    Text(mode.title)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .padding(14)
            .background(.fill)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .scaledButtonStyle()
    }
}

#Preview {
    HomeView()
}
