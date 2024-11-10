//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import Foundation
import SceneKit
import Combine

final class SceneKitViewCoordinator: NSObject {
    var subscriptions = Set<AnyCancellable>()
    
    let model: SceneModel
    let scnView: SCNView
    
    static let cameraDefaultPosition = SCNVector3(0, 20, 300)
    
    init(model: SceneModel, scnView: SCNView) {
        self.model = model
        self.scnView = scnView
    }
    
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
        cameraNode.position = Self.cameraDefaultPosition
        
        return cameraNode
    }()
    
    lazy var sun = {
        let node = NodeFactory.makePlanet(name: "Sun", radius: 30.4, image: UIImage(named: "Sun"), position: SCNVector3(0, 0, 0))
        
        node.addChildNode(mercuryOrbit)
        node.addChildNode(venusOrbit)
        node.addChildNode(earthOrbit)
        node.addChildNode(marsOrbit)
        node.addChildNode(jupiterOrbit)
        node.addChildNode(saturnOrbit)
        node.addChildNode(uranusOrbit)
        node.addChildNode(neptuneOrbit)
        
        return node
    }()
    
    lazy var mercuryOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 88)
        node.addChildNode(mercury)
        return node
    }()
    
    lazy var mercury = NodeFactory.makePlanet(name: "Mercury", radius: 2.4397, image: UIImage(named: "Mercury"), position: SCNVector3(40, 0, 0))
    
    lazy var venusOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 225)
        node.addChildNode(venus)
        return node
    }()
    
    lazy var venus = NodeFactory.makePlanet(name: "Venus", radius: 6.0518, image: UIImage(named: "Mercury"), position: SCNVector3(60, 0, 0))
    
    lazy var earthOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 365)
        node.addChildNode(earth)
        return node
    }()
    
    lazy var earth = {
        let node = NodeFactory.makePlanet(name: "Earth", radius: 6.371, image: UIImage(named: "Earth"), position: SCNVector3(80, 0, 0))
        node.addChildNode(moonOrbit)
        return node
    }()
    
    lazy var moonOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 27)
        node.addChildNode(moon)
        return node
    }()
    
    lazy var moon = NodeFactory.makePlanet(name: "Moon", radius: 1.7374, image: UIImage(named: "Moon"), position: SCNVector3(10, 0, 0))
    
    lazy var marsOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 687)
        node.addChildNode(mars)
        return node
    }()
    
    lazy var mars = NodeFactory.makePlanet(name: "Mars", radius: 3.3895, image: UIImage(named: "Mars"), position: SCNVector3(100, 0, 0))
    
    lazy var jupiterOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 3950)
        node.addChildNode(jupiter)
        return node
    }()
    
    lazy var jupiter = NodeFactory.makePlanet(name: "Jupiter", radius: 6.911, image: UIImage(named: "Jupiter"), position: SCNVector3(120, 0, 0))
    
    lazy var saturnOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 10731)
        node.addChildNode(saturn)
        return node
    }()
    
    lazy var saturn = NodeFactory.makePlanet(name: "Saturn", radius: 5.232, image: UIImage(named: "Saturn"), position: SCNVector3(140, 0, 0))
    
    lazy var uranusOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 30660)
        node.addChildNode(uranus)
        return node
    }()
    
    lazy var uranus = NodeFactory.makePlanet(name: "Uranus", radius: 6.911, image: UIImage(named: "Uranus"), position: SCNVector3(160, 0, 0))
    
    lazy var neptuneOrbit = {
        let node = NodeFactory.makePlanetOrbit(orbitalDay: 60223)
        node.addChildNode(neptune)
        return node
    }()
    
    lazy var neptune = NodeFactory.makePlanet(name: "Neptune", radius: 2.4622, image: UIImage(named: "Neptune"), position: SCNVector3(180, 0, 0))
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        guard let scnView = gesture.view as? SCNView else { return }
        let touchLocation = gesture.location(in: scnView)
        
        let hitResults = scnView.hitTest(touchLocation, options: nil)
        
        if let hitNode = hitResults.first?.node {
            self.model.clickedNode = hitNode
        }
    }
}

extension SceneKitViewCoordinator: SCNSceneRendererDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, updateAtTime time: TimeInterval) {
        guard let camera = renderer.pointOfView?.camera else { return }
        
        // Detact camera field of view
        let currentZoomLevel = camera.fieldOfView
        if currentZoomLevel != model.previousZoomLevel {
            DispatchQueue.main.async {
                self.model.previousZoomLevel = currentZoomLevel
            }
        }
        
        scnView.allowsCameraControl = model.clickedNode == nil
        
        if let clickedNode = model.clickedNode {
            let offset = SCNVector3(0, 30, 100)
            renderer.pointOfView?.position = clickedNode.worldPosition + offset
            renderer.pointOfView?.look(at: clickedNode.worldPosition)
            renderer.pointOfView?.camera = camera
            renderer.pointOfView?.rotation = .init()
//            renderer.pointOfView?.camera?.fieldOfView = clickedNode.scale
//            if let node = clickedNode.geometry as? SCNSphere {
//                node.radius
//            }
        }
    }
}
