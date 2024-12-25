//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import Foundation
import SceneKit

final class EarthModel: NSObject, ObservableObject {
    private static let cameraDefaultPosition = SCNVector3(0, 0, 30)
    
    @Published var zoomLevel: CGFloat = 0
    
    let scene = {
        let scene = SCNScene()
        
        scene.background.contents = Images.space.uiImage
        
        return scene
    }()
    
    lazy var camera = {
        let cameraNode = SCNNode()
        let camera = SCNCamera()
        camera.zFar = 10000
        camera.zNear = 0.01
        
        cameraNode.camera = camera
        cameraNode.position = Self.cameraDefaultPosition
        
        return cameraNode
    }()
    
    lazy var earth = {
        let geometry = SCNSphere(radius: 10)
        
        geometry.firstMaterial?.diffuse.contents = Images.earth.uiImage
        geometry.firstMaterial?.specular.contents = UIImage(named: "EarthSpecularMap.tif")
        let node = SCNNode(geometry: geometry)
        node.position = SCNVector3()
        node.addDirectionIndicator(for: scene.rootNode)
        return node
    }()
    
    override init() {
        super.init()
        setupScene()
    }
    
    func setupScene() {
        scene.rootNode.addChildNode(earth)
    }
}

extension EarthModel: SCNSceneRendererDelegate {
    func renderer(_ renderer: any SCNSceneRenderer, updateAtTime time: TimeInterval) {
        guard let cameraNode = renderer.pointOfView,
              let camera = cameraNode.camera else { return }
        DispatchQueue.main.async {
            self.zoomLevel = camera.fieldOfView
        }
    }
}
