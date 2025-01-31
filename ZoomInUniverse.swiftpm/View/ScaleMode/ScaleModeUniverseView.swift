import SwiftUI
import SceneKit

struct ScaleModeUniverseView: View {
    @State private var scnView = SCNView()
    @State private var cameraPosZ: Float = 0
    @State private var isEarthDetailPresent = false
    
    var body: some View {
        ScaleModeUniverseSceneView(
            scnView: scnView,
            cameraPosZ: $cameraPosZ
        )
#if !DEBUG
        .handHelper(for: .zoomInOutHand)
#endif
        .ignoresSafeArea()
        .sheet(isPresented: $isEarthDetailPresent) {
            Button("To the earth") {
                isEarthDetailPresent = false
            }
        }
    }
}
