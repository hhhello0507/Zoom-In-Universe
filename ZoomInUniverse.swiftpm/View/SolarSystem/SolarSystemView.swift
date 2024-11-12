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
//            if let node = model.clickedNode {
//                Button {
//                    model.clickedNode = nil
//                    SCNTransaction.begin()
//                    SCNTransaction.animationDuration = 0.2
////                    model.camera.position = SolarSystemModel.cameraDefaultPosition
//                    SCNTransaction.commit()
//                } label: {
//                    Text("Exit")
//                        .padding()
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//                if let name = node.name {
//                    Title(name)
//                }
//            }
        }
        .onAppear {
            if router.previousLocation == .earth {
//                model.camera.camera?.fieldOfView = 30
            }
        }
        .onChange(of: model.cameraPosZ) { posZ in
            if posZ <= 15 {
                router.currentLocation = .earth
            } else if posZ >= 440 {
                router.currentLocation = .galaxy
            }
        }
        .onChange(of: model.followEarth) { followEarth in
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 1
            if followEarth {
                model.camera.eulerAngles = SCNVector3(0, 0, 0)
                model.camera.position.y = 0
                model.camera.position.z = 100
            } else {
                model.resetCameraTransform()
            }
            SCNTransaction.commit()
        }
    }
}
