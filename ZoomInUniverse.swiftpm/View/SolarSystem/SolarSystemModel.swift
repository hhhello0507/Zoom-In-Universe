//
//  SolarSystemModel.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import Foundation
import SceneKit

final class SolarSystemModel: NSObject, ObservableObject {
    private static let cameraOrbitDefaultPos = SCNVector3(0, 150, 0)
    @Published var cameraPosZ: Float = 300
    
    var followEarth: Bool {
        cameraPosZ <= 250
    }
    
    let scnView: SCNView
    
    init(scnView: SCNView) {
        self.scnView = scnView
    }
    
    lazy var scene = {
        let scene = SCNScene()
        
        scene.background.contents = Images.space.uiImage
        scene.rootNode.addChildNode(sun)
        scene.rootNode.addChildNode(cameraOrbit)
        
        return scene
    }()
    
    lazy var cameraOrbit = {
        let node = SCNNode()
        node.position = Self.cameraOrbitDefaultPos
        node.addChildNode(camera)
        node.runAction(
            SCNAction.repeatForever(
                SCNAction.rotateBy(x: 0, y: Double.pi / 180 * 12, z: 0, duration: 1)
            )
        )
        
        return node
    }()
    
    lazy var camera = {
        let node = SCNNode()
        node.position.z = cameraPosZ
        node.eulerAngles = SCNVector3(-Double.pi / 180 * 25, 0, 0)
        
        let camera = SCNCamera()
        camera.zFar = 10000
        
        node.camera = camera
        
        return node
    }()
    
    lazy var sun = {
        let node = PlanetNodeFactory.makePlanet(name: "Sun", radius: 15.4, image: .sun, position: SCNVector3(0, 0, 0))
        
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
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 88)
        node.addChildNode(mercury)
        return node
    }()
    
    lazy var mercury = PlanetNodeFactory.makePlanet(name: "Mercury", radius: 2.4397, image: .mercury, position: SCNVector3(40, 0, 0))
    
    lazy var venusOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 225)
        node.addChildNode(venus)
        return node
    }()
    
    lazy var venus = PlanetNodeFactory.makePlanet(name: "Venus", radius: 6.0518, image: .venus, position: SCNVector3(60, 0, 0))
    
    lazy var earthOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 365)
        node.addChildNode(earth)
        return node
    }()
    
    lazy var earth = {
        let node = PlanetNodeFactory.makePlanet(name: "Earth", radius: 6.371, image: .earth, position: SCNVector3(80, 0, 0))
        node.addChildNode(moonOrbit)
        return node
    }()
    
    lazy var moonOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 27)
        node.addChildNode(moon)
        return node
    }()
    
    lazy var moon = PlanetNodeFactory.makePlanet(name: "Moon", radius: 1.7374, image: .moon, position: SCNVector3(10, 0, 0))
    
    lazy var marsOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 687)
        node.addChildNode(mars)
        return node
    }()
    
    lazy var mars = PlanetNodeFactory.makePlanet(name: "Mars", radius: 3.3895, image: .mars, position: SCNVector3(100, 0, 0))
    
    lazy var jupiterOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 3950)
        node.addChildNode(jupiter)
        return node
    }()
    
    lazy var jupiter = PlanetNodeFactory.makePlanet(name: "Jupiter", radius: 6.911, image: .jupiter, position: SCNVector3(120, 0, 0))
    
    lazy var saturnOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 10731)
        node.addChildNode(saturn)
        return node
    }()
    
    lazy var saturn = PlanetNodeFactory.makePlanet(name: "Saturn", radius: 5.232, image: .saturn, position: SCNVector3(140, 0, 0))
    
    lazy var uranusOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 30660)
        node.addChildNode(uranus)
        return node
    }()
    
    lazy var uranus = PlanetNodeFactory.makePlanet(name: "Uranus", radius: 6.911, image: .uranus, position: SCNVector3(160, 0, 0))
    
    lazy var neptuneOrbit = {
        let node = PlanetNodeFactory.makePlanetOrbit(orbitalDay: 60223)
        node.addChildNode(neptune)
        return node
    }()
    
    lazy var neptune = PlanetNodeFactory.makePlanet(name: "Neptune", radius: 2.4622, image: .neptune, position: SCNVector3(180, 0, 0))
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        guard let scnView = gesture.view as? SCNView else { return }
        let touchLocation = gesture.location(in: scnView)
        
        let hitResults = scnView.hitTest(touchLocation, options: nil)
        
        if let hitNode = hitResults.first?.node {
//            DispatchQueue.main.async {
//                self.clickedNode = hitNode
//            }
        }
    }
    
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        let scale = Float(gestureRecognizer.scale)
        let deltaZ = (1.0 - scale) * 100
        if followEarth {
            self.camera.position.z += deltaZ
            if self.camera.position.z >= 100 {
                self.camera.position.z = 251
            }
        } else {
            self.camera.position.z += deltaZ
            self.camera.position.y += deltaZ * 0.65
        }
        DispatchQueue.main.async {
            self.cameraPosZ = self.camera.position.z
        }
        scnView.setNeedsDisplay()
        gestureRecognizer.scale = 1.0
    }
    
    func followCameraToEarth() {
        self.cameraOrbit.position = self.earth.worldPosition
    }
    
    func resetCameraTransform() {
        self.cameraOrbit.position = Self.cameraOrbitDefaultPos
        self.camera.eulerAngles = SCNVector3(-Double.pi / 180 * 25, 0, 0)
    }
}

extension SolarSystemModel: SCNSceneRendererDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if followEarth {
            self.followCameraToEarth()
        } else {
            self.resetCameraTransform()
        }
    }
}
