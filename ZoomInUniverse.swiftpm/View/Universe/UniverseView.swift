//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI
import SceneKit

struct UniverseView: View {
    enum Object: String {
        case galaxy = "Galaxy"
        case solarSystem = "SolarSystem"
    }
    @EnvironmentObject private var router: Router
    @StateObject private var model: UniverseModel
    @State private var scnView = SCNView()
    
    private var currentObject: Object {
        switch model.cameraPosZ {
        case ..<35: .solarSystem
        default: .galaxy
        }
    }
    
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
                    print(posZ)
                    if posZ <= 10 {
                        router.destination = .solarSystem
                    }
                }
            Title(currentObject.rawValue)
                .animation(.easeInOut, value: currentObject)
        }
    }
}
