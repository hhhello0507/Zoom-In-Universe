//
//  SolarSystemModel.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import Foundation
import SceneKit

final class UniverseModel: NSObject, ObservableObject {
    static let cameraDefaultPosition = SCNVector3(0, 0, 30)
    
    @Published var cameraPosZ: Float = 0
    
    let scnView: SCNView
    
    init(scnView: SCNView) {
        self.scnView = scnView
    }
    
    lazy var scene = {
        let scene = SCNScene()
        
        scene.background.contents = Images.space.uiImage
        
        scene.rootNode.addChildNode(cosmicWeb)
        scene.rootNode.addChildNode(universe)
        scene.rootNode.addChildNode(multiVerse)
        
        return scene
    }()
    
    lazy var camera = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.zFar = 10000
        
        cameraNode.camera = camera
        cameraNode.position = Self.cameraDefaultPosition
        
        return cameraNode
    }()
    
    lazy var cosmicWeb = {
        let geometry = SCNSphere(radius: 10)
        geometry.firstMaterial?.diffuse.contents = Images.cosmicWeb.uiImage
        let node = SCNNode(geometry: geometry)
        return node
    }()
    
    lazy var universe = {
        let geometry = SCNSphere(radius: 10)
        geometry.firstMaterial?.diffuse.contents = Images.universe.uiImage
        let node = SCNNode(geometry: geometry)
        node.position = SCNVector3(0, 0, 100)
        return node
    }()
    
    lazy var multiVerse = {
        let radius = 10.0
        let geometry = SCNSphere(radius: CGFloat(radius))
        geometry.firstMaterial?.diffuse.contents = Images.universe.uiImage
        let node = SCNNode()
        node.position = SCNVector3(0, 0, 300)
        node.eulerAngles = SCNVector3(0, 0, 45)
        
        let n = 40
        let offset = Double(n - 1) * radius
        
        for i in 0..<n {
            for j in 0..<n {
                let model = SCNNode(geometry: geometry)
                let x = radius * (Double(i) - 1) * 2 + radius - offset
                let y = radius * (Double(j) - 1) * 2 + radius - offset
                print(x, y)
                if x * x + y * y <= 250 * 250 {
                    model.position = SCNVector3(x, y, 0)
                    model.eulerAngles = .randomRotation()
                    model.runAction(
                        SCNAction.repeatForever(
                            SCNAction.rotateBy(x: 2 * .pi, y: 2 * .pi, z: 2 * .pi, duration: 20)
                        )
                    )
                    node.addChildNode(model)
                }
            }
        }
        
        return node
    }()
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        let scale = Float(gestureRecognizer.scale)
        let deltaZ = (1.0 - scale) * 100
        if deltaZ < 0 || self.camera.position.z <= 470 {
            self.camera.position.z += deltaZ
            DispatchQueue.main.async {
                self.cameraPosZ = self.camera.position.z
            }
            scnView.setNeedsDisplay()
        }
        
        gestureRecognizer.scale = 1.0
    }
}

extension UniverseModel: SCNSceneRendererDelegate {
}
