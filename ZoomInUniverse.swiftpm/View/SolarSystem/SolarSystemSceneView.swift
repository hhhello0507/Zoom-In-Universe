//
//  SceneKitView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import SwiftUI
import Combine
import SceneKit

struct SolarSystemSceneView: UIViewRepresentable {
    @ObservedObject var model: SolarSystemModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = model.scene
        scnView.pointOfView = model.camera
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = model
        scnView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: model, action: #selector(model.handleTap))
        scnView.addGestureRecognizer(tapGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: model, action: #selector(model.handlePinchGesture))
        scnView.addGestureRecognizer(pinchGesture)
        
        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
    }
}
