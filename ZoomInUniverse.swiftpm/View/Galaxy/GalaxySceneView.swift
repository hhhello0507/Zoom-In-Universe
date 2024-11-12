//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI
import SceneKit

struct GalaxySceneView: UIViewRepresentable {
    @ObservedObject var model: GalaxyModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = model.scene
        scnView.pointOfView = model.camera
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = model
        scnView.isUserInteractionEnabled = true
        
        // set up gesture
        let panGesture = UIPinchGestureRecognizer(target: model, action: #selector(model.handlePinchGesture))
        scnView.addGestureRecognizer(panGesture)
        
        return scnView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
}
