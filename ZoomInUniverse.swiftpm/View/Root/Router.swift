//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation

enum Destination {
    case universe
    case solarSystem
}

final class Router: ObservableObject {
    @Published var destination = Destination.solarSystem
}
