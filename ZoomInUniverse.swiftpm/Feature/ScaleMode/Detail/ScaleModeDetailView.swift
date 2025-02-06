import SwiftUI
import SceneKit

struct ScaleModeDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var scene: SCNScene
    let node: SCNNode
    let dismissCallback: (() -> Void)?
    let camera = SCNNode().apply {
        $0.camera = SCNCamera().apply {
            $0.zFar = 10000
            $0.zNear = 0.01
        }
        $0.position.z += 50
    }
    
    init(node: SCNNode, dismiss: (() -> Void)? = nil) {
        node.position = .init()
        self._scene = .init(wrappedValue: .init().apply {
            $0.rootNode.addChildNode(node)
            $0.background.contents = UIColor.black
        })
        self.node = node
        self.dismissCallback = dismiss
    }
    
    var body: some View {
        ZStack {
            SceneView(
                scene: scene,
                pointOfView: camera,
                options: [.autoenablesDefaultLighting, .allowsCameraControl]
            )
            .ignoresSafeArea()
            IconButton(icon: "Chevron-Left") {
                dismiss()
                dismissCallback?()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(12)
        }
        .navigationBarBackButtonHidden()
    }
}
