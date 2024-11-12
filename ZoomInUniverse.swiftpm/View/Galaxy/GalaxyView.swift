//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI
import SceneKit

struct GalaxyView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var model: GalaxyModel
    @State private var scnView = SCNView()
    
    init() {
        let scnView = SCNView()
        self.scnView = scnView
        self._model = StateObject(wrappedValue: GalaxyModel(scnView: scnView))
    }
    
    var body: some View {
        ZStack {
            GalaxySceneView(model: model, scnView: scnView)
                .ignoresSafeArea()
                .onChange(of: model.cameraPosZ) { posZ in
                    router.currentLocation = switch posZ {
                    case ..<10: .solarSystem
//                    case ..<35: .solarSystem
                    case ..<120: .blackHole
                    case 600...: .supercluster
                    default: .galaxy
                    }
                }
            Title(router.currentLocation.rawValue)
                .animation(.easeInOut, value: router.currentLocation)
        }
        .onAppear {
            if router.previousLocation == .supercluster {
                var pos = GalaxyModel.cameraDefaultPosition
                pos.z = 600
                model.camera.position = pos
            }
        }
    }
}
