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
        UniverseSceneView(model: model, scnView: scnView)
            .ignoresSafeArea()
            .onChange(of: model.cameraPosZ) { posZ in
                router.currentDestination = switch posZ {
                case ..<20: .galaxyCluster
                case ..<100: .supercluster
                case ..<300: .universe
                default: .multiVerse
                }
            }
    }
}
