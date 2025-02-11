//
//  Images.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//


import UIKit
import SwiftUI

enum Images: String {
    case sun = "Sun"
    case mercury = "Mercury"
    case venus = "Venus"
    case earth = "Earth"
    case moon = "Moon"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Neptune"
    case space = "Space"
    case cosmicWeb = "CosmicWeb"
    
    case zoomInOutHand = "ZoomInOutHand"
    case moveHand = "MoveHand"
    
    var uiImage: UIImage? {
        UIImage(named: self.rawValue)
    }
}

extension Image {
    init(type: Images) {
        self = Image(type.rawValue)
    }
}
