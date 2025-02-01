import SwiftUI
import SceneKit

struct ScaleModeView: View {
    @State private var scnView = SCNView()
    @State private var cameraPosZ: Float = 0
    
    var body: some View {
        ScaleModeSceneView(
            scnView: scnView,
            cameraPosZ: $cameraPosZ
        )
#if !DEBUG
        .handHelper(for: .zoomInOutHand)
#endif
        .ignoresSafeArea()
    }
}
