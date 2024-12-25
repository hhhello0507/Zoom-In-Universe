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
        SolarSystemSceneView(model: model, scnView: scnView)
            .ignoresSafeArea()
            .onChange(of: model.cameraPosZ) { _, posZ in
                router.currentDestination = switch posZ {
                case ...15: .inEarth
                case ...100: .earth
                case ...400: .inSolarSystem
                default: .solarSystem
                }
            }
            .onChange(of: model.followEarth) { _, followEarth in
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
