//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation
import SceneKit

final class GalaxyModel: NSObject, ObservableObject {
    static let cameraDefaultPosition = SCNVector3(0, 0, 35)
    
    @Published var cameraPosZ: Float = 200
    
    let scnView: SCNView
    
    lazy var scene = SCNScene()
    
    lazy var camera = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.zFar = 10000
        camera.zNear = 0.01
        
        cameraNode.camera = camera
        cameraNode.position = Self.cameraDefaultPosition
        
        return cameraNode
    }()
    
    lazy var galaxyCluster: SCNNode = {
        let node = SCNNode()
        node.position = SCNVector3(6, 0, 360)
        Array(repeating: 0, count: 8).forEach { _ in
            guard let model = Models.galaxy.node else { return }
            let parentNode = SCNNode()
            parentNode.eulerAngles = .randomRotation()
            parentNode.position = .random(in: -6..<6)
            model.scale = SCNVector3(0.01, 0.01, 0.01)
            model.runAction(
                SCNAction.repeatForever(
                    SCNAction.rotateBy(x: 0, y: 0, z: 2 * .pi, duration: 20)
                )
            )
            parentNode.addChildNode(model)
            node.addChildNode(parentNode)
        }
        return node
    }()
    
    lazy var galaxy: SCNNode? = {
        let node = SCNNode()
        node.eulerAngles = SCNVector3(-Double.pi / 180 * 64, Double.pi / 180 * 30, 0)
        node.position = SCNVector3(x: -20, y: 0, z: 200)
//        node.addDirectionIndicator(for: scene.rootNode)
        
        guard let model = Models.galaxy.node else { return nil }
        model.scale = SCNVector3(0.2, 0.2, 0.2)
        model.runAction(
            SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: 0, z: 2 * .pi, duration: 20)
            )
        )
        node.addChildNode(model)
        
        return node
    }()
    
    lazy var blackHole: SCNNode? = {
        let node = SCNNode()
        node.position = SCNVector3(-6.4, 0, 150)
        node.eulerAngles = SCNVector3(Double.pi / 180 * 10, 0, Double.pi / 180 * 10)  
        
        guard let model = Models.blackHole.node else { return nil }
        model.addBloomEffect()
        model.scale = SCNVector3(0.03, 0.03, 0.03)
        model.runAction(
            SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 1)
            )
        )
        
        node.addChildNode(model)
        
        return node
    }()
    
    lazy var solarSystem = {
        let node = PlanetNodeFactory.makePlanet(radius: 3, image: .sun, position: SCNVector3(0, 0, 0))
        
        node.runAction(
            SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 10)
            )
        )
        
        return node
    }()
    
    lazy var starCluster = {
        let node = SCNNode()
        node.position = SCNVector3(x: 3, y: 1.2, z: 72)
        node.addBloomEffect(intensity: 1)
        
        Array(repeating: 0, count: 60).forEach { _ in
            let starNode = StarNodeFactory.makeStarNode()
            node.addChildNode(starNode)
            let (x, y, z) = randomPointOnEllipsoid(a: 1, b: 4, c: 9)
            starNode.position = SCNVector3(x, y, z)
        }
        return node
    }()
    
    init(scnView: SCNView) {
        self.scnView = scnView
        super.init()
        
        self.setupScene()
    }
    
    private func setupScene() {
        scene.background.contents = Images.space.uiImage
        [
            galaxyCluster,
            galaxy,
            blackHole,
            starCluster,
            solarSystem
        ].compactMap(\.self).forEach { node in
            scene.rootNode.addChildNode(node)
        }
    }
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        let scale = Float(gestureRecognizer.scale)
        let deltaZ = (1.0 - scale) * 100
        self.camera.position.z += deltaZ
        DispatchQueue.main.async {
            self.cameraPosZ = self.camera.position.z
        }
        scnView.setNeedsDisplay()
        
        gestureRecognizer.scale = 1.0
    }
}

extension GalaxyModel: SCNSceneRendererDelegate {
}
