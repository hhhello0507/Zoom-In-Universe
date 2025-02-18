import SwiftUI

enum Mode: CaseIterable, Hashable {
    case scale
    
    var image: String {
        switch self {
        case .scale:
            "ScaleMode"
        }
    }
    
    var title: String {
        switch self {
        case .scale:
            "Scale Mode"
        }
    }
    
    var description: String {
        switch self {
        case .scale:
            "Scale Mode lets you zoom in and out to explore the universe at any scale – from entire galaxies to the smallest cosmic details. Experience the vastness of space in the palm of your hand! ✨🌌"
        }
    }
}
