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
            switch router.destination {
            case .universe:
                UniverseView()
            case .solarSystem:
                SolarSystemView()
            }
        }
        .environmentObject(router)
        .animation(.easeInOut, value: router.destination)
    }
}
