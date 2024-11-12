//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI

struct RootView: View {
    @StateObject private var router = Router()
    
    var body: some View {
        Group {
            switch router.currentLocation {
            case .supercluster, .universe, .multiVerse:
                UniverseView()
            case .starCluster, .blackHole, .galaxy, .galaxyCluster:
                GalaxyView()
            case .solarSystem:
                SolarSystemView()
            case .earth:
                EarthView()
            }
        }
        .environmentObject(router)
        .animation(.easeInOut, value: router.currentLocation)
    }
}
