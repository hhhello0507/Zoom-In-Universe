//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import SwiftUI
import SceneKit

struct EarthView: View {
    @EnvironmentObject private var router: Router
    @StateObject private var model = EarthModel()
    @State private var scnView = SCNView()
    
    var body: some View {
        EarthSceneView(model: model, scnView: scnView)
            .ignoresSafeArea()
            .onChange(of: model.zoomLevel) { _, zoomLevel in
                if zoomLevel >= 120 {
                    router.currentDestination = .inSolarSystem
                }
            }
    }
}
