import SwiftUI
import SceneKit

struct SolarSystemView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var model: SolarSystemModel
    @State private var scnView: SCNView
    
    init() {
        let scnView = SCNView()
        self.scnView = scnView
        self._model = StateObject(wrappedValue: SolarSystemModel(scnView: scnView))
    }
    
    var body: some View {
        ZStack {
            SolarSystemSceneView(model: model, scnView: scnView)
                .ignoresSafeArea()
                .onChange(of: model.zoomLevel) { zoomLevel in
                    if zoomLevel >= 120 {
                        router.destination = .universe
                    }
                }
            if let node = model.clickedNode {
                Button {
                    model.clickedNode = nil
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 0.5
                    scnView.pointOfView?.position = SolarSystemModel.cameraDefaultPosition
                    scnView.pointOfView?.rotation = .init()
                    SCNTransaction.commit()
                } label: {
                    Text("Exit")
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                if let name = node.name {
                    Title(name)
                }
            }
        }
    }
}
