import SwiftUI
import SceneKit

struct NormalDetailView: View {
    @State private var isSheetPresented = true
    @State private var presentationDetent = PresentationDetent.height(100)
    
    let node: SCNNode
    let type: NodeType
    init(
        node: SCNNode,
        type: NodeType
    ) {
        self.node = node
        self.type = type
    }
    
    var body: some View {
        ScaleModeDetailView(
            node: node.clone()
        ) {
            self.isSheetPresented = false
        }
        .sheet(isPresented: $isSheetPresented) {
            ScrollView {
                LazyVStack {
                    if let name = node.name {
                        Text(name)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    type.description
                }
                .padding(16)
            }
            .presentationDetents([.height(100), .medium, .large, ], selection: $presentationDetent)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            .interactiveDismissDisabled()
        }
    }
}
