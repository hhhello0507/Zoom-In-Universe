enum Mode: CaseIterable, Hashable {
    case scale
    case time
    
    var title: String {
        switch self {
        case .scale:
            "Scale Mode"
        case .time:
            "Time Mode"
        }
    }
}
