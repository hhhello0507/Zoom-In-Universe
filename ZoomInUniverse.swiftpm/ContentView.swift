import SwiftUI
import SceneKit
final class SceneModel: NSObject, ObservableObject {
    @Published var previousZoomLevel: CGFloat = 0
    
    lazy var scene = {
        let scene = SCNScene()
        
        scene.background.contents = UIImage(named: "Space")
        scene.rootNode.addChildNode(sun)
        
        return scene
    }()
    
    lazy var camera = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.fieldOfView = 90
        camera.zFar = 10000
        
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(0, 0, 150)
        cameraNode.look(at: SCNVector3(0, 0, 0))
        
        return cameraNode
    }()
    
    lazy var sun = {
        let node = SCNNode(geometry: SCNSphere(radius: 30.4))
        node.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Sun")
        node.position = SCNVector3(0, 0, 0)
        
        let rotateAction = SCNAction.repeatForever(
            SCNAction.rotateBy(
                x: 0,
                y: 0.05 * Double.pi,
                z: 0,
                duration: 1
            )
        )
        node.runAction(rotateAction)
        
        node.addChildNode(mercuryOrbit)
        node.addChildNode(venusOrbit)
        node.addChildNode(earthOrbit)
        node.addChildNode(marsOrbit)
        node.addChildNode(jupiterOrbit)
        node.addChildNode(saturnOrbit)
        node.addChildNode(uranusOrbit)
        node.addChildNode(nepturnOrbit)
        
        return node
    }()
    
    lazy var mercuryOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 88)
        node.addChildNode(mercury)
        return node
    }()
    
    lazy var mercury = NodeFactory.makePlanet(radius: 2.4397, image: UIImage(named: "Mercury"), position: SCNVector3(40, 0, 0))
    
    lazy var venusOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 225)
        node.addChildNode(venus)
        return node
    }()
    
    lazy var venus = NodeFactory.makePlanet(radius: 6.0518, image: UIImage(named: "Mercury"), position: SCNVector3(60, 0, 0))
    
    lazy var earthOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 365)
        node.addChildNode(earth)
        return node
    }()
    
    lazy var earth = {
        let node = NodeFactory.makePlanet(radius: 6.371, image: UIImage(named: "Earth"), position: SCNVector3(80, 0, 0))
        node.addChildNode(moonOrbit)
        return node
    }()
    
    lazy var moonOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 27)
        node.addChildNode(moon)
        return node
    }()
    
    lazy var moon = NodeFactory.makePlanet(radius: 1.7374, image: UIImage(named: "Moon"), position: SCNVector3(10, 0, 0))
    
    lazy var marsOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 687)
        node.addChildNode(mars)
        return node
    }()
    
    lazy var mars = NodeFactory.makePlanet(radius: 3.3895, image: UIImage(named: "Mars"), position: SCNVector3(100, 0, 0))
    
    lazy var jupiterOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 3950)
        node.addChildNode(jupiter)
        return node
    }()
    
    lazy var jupiter = NodeFactory.makePlanet(radius: 6.911, image: UIImage(named: "Jupiter"), position: SCNVector3(120, 0, 0))
    
    lazy var saturnOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 10731)
        node.addChildNode(saturn)
        return node
    }()
    
    lazy var saturn = NodeFactory.makePlanet(radius: 5.232, image: UIImage(named: "Saturn"), position: SCNVector3(140, 0, 0))
    
    lazy var uranusOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 30660)
        node.addChildNode(uranus)
        return node
    }()
    
    lazy var uranus = NodeFactory.makePlanet(radius: 6.911, image: UIImage(named: "Uranus"), position: SCNVector3(160, 0, 0))
    
    lazy var nepturnOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 60223)
        node.addChildNode(nepturn)
        return node
    }()
    
    lazy var nepturn = NodeFactory.makePlanet(radius: 2.4622, image: UIImage(named: "Nepturn"), position: SCNVector3(160, 0, 0))
}

extension SceneModel: SCNSceneRendererDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, updateAtTime time: TimeInterval) {
        guard let camera = renderer.pointOfView?.camera else { return }
        let currentZoomLevel = camera.fieldOfView
        
        // Zoom level이 변경되었을 때 바인딩 값을 업데이트
        if currentZoomLevel != previousZoomLevel {
            DispatchQueue.main.async {
                self.previousZoomLevel = currentZoomLevel
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var model = SceneModel()
    
    var body: some View {
        SceneView(
            scene: model.scene,
            pointOfView: model.camera,
            options: [.allowsCameraControl, .autoenablesDefaultLighting],
            delegate: model
        )
        .ignoresSafeArea()
        .onChange(of: model.previousZoomLevel) {
            print("Changed at \($0)")
        }
    }
}
