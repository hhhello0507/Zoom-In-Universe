import SceneKit

enum GlobalCreator {
    static func createBackground(
        radiusOffset: Int,
        contents: Any?,
        size: CGFloat = 2000
    ) -> SCNNode {
        SCNNode().apply {
            $0.geometry = SCNTube(innerRadius: 299.9 - CGFloat(radiusOffset), outerRadius: 300 - CGFloat(radiusOffset), height: size).apply {
                $0.materials.forEach {
                    $0.diffuse.contents = contents
                    $0.lightingModel = .constant
                }
            }
            $0.eulerAngles = SCNVector3(-Double.pi / 2, 0, 0)
            $0.position.z += Float(size) / 2
        }
    }
}
