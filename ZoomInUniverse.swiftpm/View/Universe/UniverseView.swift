//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import SwiftUI
import SceneKit

struct UniverseView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var model: UniverseModel
    @State private var scnView = SCNView()
    
    init() {
        let scnView = SCNView()
        self.scnView = scnView
        self._model = StateObject(wrappedValue: UniverseModel(scnView: scnView))
    }
    
    var body: some View {
        ZStack {
            UniverseSceneView(model: model, scnView: scnView)
                .ignoresSafeArea()
                .onChange(of: model.cameraPosZ) { posZ in
                    if posZ <= 20 {
                        router.currentLocation = .galaxy
                    }
                }
            Title(router.currentLocation.rawValue)
                .animation(.easeInOut, value: router.currentLocation)
        }
        .onChange(of: model.cameraPosZ) {
            print($0)
        }
    }
}
