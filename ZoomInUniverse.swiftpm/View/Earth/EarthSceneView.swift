//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import SwiftUI
import Combine
import SceneKit

struct EarthSceneView: UIViewRepresentable {
    @ObservedObject var model: EarthModel
    
    let scnView: SCNView
    
    func makeUIView(context: Context) -> SCNView {
        scnView.scene = model.scene
        scnView.pointOfView = model.camera
        scnView.autoenablesDefaultLighting = true
        scnView.allowsCameraControl = true
        scnView.delegate = model
        
        return scnView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
    }
}
