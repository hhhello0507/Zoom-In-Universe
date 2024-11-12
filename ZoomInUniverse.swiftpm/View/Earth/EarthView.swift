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
        ZStack {
            EarthSceneView(model: model, scnView: scnView)
                .ignoresSafeArea()
            Title(router.currentLocation.rawValue)
        }
        .onChange(of: model.zoomLevel) { zoomLevel in
            if zoomLevel >= 120 {
                router.currentLocation = .solarSystem
            }
        }
    }
}
