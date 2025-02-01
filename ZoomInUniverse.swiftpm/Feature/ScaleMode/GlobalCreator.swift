import SceneKit

enum GlobalCreator {
    static func createBackground(
        radiusOffset: Int,
        contents: Any?,
        size: CGFloat = 2000
    ) -> SCNNode {
        SCNNode().apply {
            $0.geometry = SCNTube(innerRadius: 149.9 - CGFloat(radiusOffset), outerRadius: 150 - CGFloat(radiusOffset), height: size).apply {
                let material = SCNMaterial().apply {
                    $0.diffuse.contents = contents
                    $0.lightingModel = .constant
//                    $0.transparencyMode = .rgbZero
//                    $0.blendMode = .alpha
//                    $0.isDoubleSided = true
//                    $0.writesToDepthBuffer = false
                }
                $0.materials = [material, material, material]
            }
            $0.eulerAngles = SCNVector3(-Double.pi / 2, 0, 0)
            $0.position.z += Float(size) / 2
        }
    }
}
