//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation
import SceneKit
import SceneKit.ModelIO

final class UniverseModel: NSObject, ObservableObject {
    private static let cameraDefaultPosition = SCNVector3(0, 0, 200)
    
    @Published var zoomLevel: CGFloat = 0
    @Published var cameraPosZ: Float = 200
    
    let scnView: SCNView
    
    init(scnView: SCNView) {
        self.scnView = scnView
    }
    
    lazy var scene = {
        let scene = SCNScene()
        
        scene.background.contents = UIImage(named: "Space")
        [galaxy, solarSystem].compactMap(\.self).forEach { node in
            scene.rootNode.addChildNode(node)
        }
        
        return scene
    }()
    
    lazy var camera = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.fieldOfView = 90
        camera.zFar = 10000
        
        cameraNode.camera = camera
        cameraNode.position = Self.cameraDefaultPosition
        
        return cameraNode
    }()
    
    lazy var galaxy: SCNNode? = {
        guard let url = Bundle.main.url(forResource: "Galaxy", withExtension: "usdz") else {
            print("NIL")
            return nil
        }
        
        guard let scene = try? SCNScene(url: url, options: nil) else {
            print("Failed to load Galaxy scene")
            return nil
        }
        let modelNode = scene.rootNode
        modelNode.position = SCNVector3(x: -10, y: 0, z: -1)
        modelNode.rotation = SCNVector4(10, 20, 10, 10)
        modelNode.scale = SCNVector3(0.2, 0.2, 0.2)
        
        return modelNode
    }()
    
    lazy var solarSystem = {
        let node = NodeFactory.makePlanet(radius: 3, image: UIImage(named: "Sun"), position: SCNVector3(0, 0, 0))
        return node
    }()
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        let scale = Float(gestureRecognizer.scale)
        let deltaZ = (1.0 - scale) * 100
        self.camera.position.z += deltaZ
        self.cameraPosZ = self.camera.position.z
        scnView.setNeedsDisplay()
        
        gestureRecognizer.scale = 1.0
    }
}

extension UniverseModel: SCNSceneRendererDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, updateAtTime time: TimeInterval) {
        guard let cameraNode = renderer.pointOfView,
              let camera = cameraNode.camera else { return }
        
        // Detact camera field of view
        let currentZoomLevel = camera.fieldOfView
        if currentZoomLevel != zoomLevel {
            DispatchQueue.main.async {
                self.zoomLevel = currentZoomLevel
            }
        }
    }
}
