import SwiftUI

enum Mode: CaseIterable, Hashable {
    case scale
    case time
    
    var image: String {
        switch self {
        case .scale:
            "ScaleMode"
        case .time:
            "TimeMode"
        }
    }
    
    var title: String {
        switch self {
        case .scale:
            "Scale Mode"
        case .time:
            "Time Mode"
        }
    }
    
    var description: String {
        switch self {
        case .scale:
            "it's scale mode"
        case .time:
            "it's time mode"
        }
    }
}
