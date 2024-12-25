import SceneKit

enum Models: String {
    case galaxy = "Galaxy"
    case blackHole = "BlackHole"
    
    var node: SCNNode? {
        switch self {
        case .galaxy:
            Self.galaxyModel?.clone()
        case .blackHole:
            Self.blackHoleModel?.clone()
        }
    }
    
    static let galaxyModel = Self.getModel(name: Self.galaxy.rawValue)
    static let blackHoleModel = Self.getModel(name: Self.blackHole.rawValue)
    
    static func getModel(name: String) -> SCNNode? {
//        print("Load model - \(name)")
        guard let url = Bundle.main.url(forResource: name, withExtension: "usdz"),
              let scene = try? SCNScene(url: url, options: nil) else {
            return nil
        }
        return scene.rootNode
    }
}
