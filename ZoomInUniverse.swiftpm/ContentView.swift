import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        SceneView(
            scene: createScene(),
            pointOfView: createCamera(),
            options: [.allowsCameraControl, .autoenablesDefaultLighting]
        )
        .ignoresSafeArea()
    }
    
    func createScene() -> SCNScene {
        let scene = SCNScene()
        
        let boxNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        boxNode.position = SCNVector3(0, 0, -5)
        scene.rootNode.addChildNode(boxNode)
        
        return scene
    }
    
    func createCamera() -> SCNNode {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 5)
        
        return cameraNode
    }
}
