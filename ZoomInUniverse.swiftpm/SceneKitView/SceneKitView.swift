//
//  SceneKitView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import SwiftUI
import Combine
import SceneKit

struct SceneKitView: UIViewRepresentable {
    @ObservedObject var model: SceneModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = context.coordinator.scene
        scnView.pointOfView = context.coordinator.camera
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.delegate = context.coordinator
        scnView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        scnView.addGestureRecognizer(tapGesture)
        
        return scnView
    }

    func updateUIView(_ scnView: SCNView, context: Context) {
    }
    
    func makeCoordinator() -> SceneKitViewCoordinator {
        return SceneKitViewCoordinator(model: model, scnView: scnView)
    }
}
