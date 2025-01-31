import SceneKit

enum DummyCreator {
    static func createDummy() -> SCNNode {
        return SCNNode().apply {
            $0.geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0).apply {
                $0.firstMaterial?.diffuse.contents = UIColor.red
            }
        }
    }
}
