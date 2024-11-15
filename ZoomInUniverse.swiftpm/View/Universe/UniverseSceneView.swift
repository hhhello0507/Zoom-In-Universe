//
//  SceneKitView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import SwiftUI
import Combine
import SceneKit

struct UniverseSceneView: UIViewRepresentable {
    @ObservedObject var model: UniverseModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = model.scene
        scnView.pointOfView = model.camera
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = model
        
        let tapGesture = UIPinchGestureRecognizer(target: model, action: #selector(model.handlePinchGesture))
        scnView.addGestureRecognizer(tapGesture)
        
        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
    }
}
