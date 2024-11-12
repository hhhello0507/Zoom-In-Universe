//
//  Images.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//


import UIKit

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
    case universe = "Universe"
    
    var uiImage: UIImage? {
        UIImage(named: self.rawValue)
    }
}