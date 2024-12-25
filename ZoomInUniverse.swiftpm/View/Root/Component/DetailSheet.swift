import SwiftUI

struct DetailSheet: View {
    private let destination: Destination
    @Binding private var presentationDetent: PresentationDetent
    
    init(
        destination: Destination,
        presentationDetent: Binding<PresentationDetent>
    ) {
        self.destination = destination
        self._presentationDetent = presentationDetent
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(destination.text)
                    .bold()
                    .font(.title)
                ZStack(alignment: .topLeading) {
                    Text(destination.description)
                        .font(.body)
                        .opacity(0.8)
                        .fadeInOut(presentationDetent != .height(100), animation: .spring(duration: 0.4))
                    Button("more") {
                        presentationDetent = .medium
                    }
                    .foregroundStyle(.foreground)
                    .font(.body)
                    .opacity(0.6)
                    .fadeInOut(presentationDetent == .height(100), animation: .spring(duration: 0.4))
                }
                Spacer()
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
