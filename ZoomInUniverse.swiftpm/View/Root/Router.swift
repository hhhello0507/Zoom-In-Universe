//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation

enum Destination: String {
    case multiVerse = "MultiVerse"
    case universe = "Universe"
    case supercluster = "Supercluster"
    case galaxyCluster = "GalaxyCluster"
    case galaxy = "Galaxy"
    case blackHole = "BlackHole"
    case starCluster = "StarCluster"
    case solarSystem = "SolarSystem"
    case earth = "Earth"
}

final class Router: ObservableObject {
    @Published var currentLocation = Destination.solarSystem {
        willSet {
            previousLocation = currentLocation
        }
    }
    @Published var previousLocation: Destination?
}
