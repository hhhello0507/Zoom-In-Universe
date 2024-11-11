//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI
import SceneKit

struct UniverseSceneView: UIViewRepresentable {
    @ObservedObject var model: UniverseModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = model.scene
        scnView.pointOfView = model.camera
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = model
        scnView.isUserInteractionEnabled = true
        
        let panGesture = UIPinchGestureRecognizer(target: model, action: #selector(model.handlePinchGesture))
        scnView.addGestureRecognizer(panGesture)
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}
