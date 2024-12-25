//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI

private extension Destination {
    enum RootViewType {
        case universe
        case galaxy
        case inSolarSystem
        case inEarth
    }
    
    var rootViewType: RootViewType {
        switch self {
        case .supercluster, .universe, .multiVerse: .universe
        case .solarSystem, .starCluster, .blackHole, .galaxy, .galaxyCluster: .galaxy
        case .inSolarSystem, .earth: .inSolarSystem
        case .inEarth: .inEarth
        }
    }
}

struct RootView: View {
    @StateObject private var router = Router()
    @State private var isSheetPresented = false
    @State private var presentationDetent = PresentationDetent.height(100)
    
    var body: some View {
        ZStack {
            switch router.currentDestination.rootViewType {
            case .universe:
                UniverseView()
                    .handHelper(for: .zoomInOutHand)
            case .galaxy:
                GalaxyView()
                    .handHelper(for: .zoomInOutHand)
            case .inSolarSystem:
                SolarSystemView()
                    .handHelper(for: .zoomInOutHand)
            case .inEarth:
                EarthView()
                    .handHelper(for: .moveHand)
            }
        }
        .environmentObject(router)
        .sheet(isPresented: $isSheetPresented) {
            DetailSheet(
                destination: router.currentDestination,
                presentationDetent: $presentationDetent
            )
            .presentationDetents([.height(100), .medium, .large], selection: $presentationDetent)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            .interactiveDismissDisabled()
        }
        .onChange(of: router.currentDestination.rootViewType, initial: true) {
            isSheetPresented = false
            Task {
                try? await Task.sleep(for: .seconds(2.5))
                isSheetPresented = true
            }
        }
    }
}
