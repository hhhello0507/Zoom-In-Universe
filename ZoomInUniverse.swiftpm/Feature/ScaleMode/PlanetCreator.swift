import SceneKit

private let timeWeight: Double = 3

enum PlanetCreator {
    /// | orbitalDay - ex. Earch orbital days is 365.
    static func makePlanetOrbit(orbitalDay: Double, radius: Double) -> SCNNode {
        return SCNNode().apply {
            $0.eulerAngles.y = .random(in: 0..<(2 * .pi)) // random rotation
            $0.runAction(
                SCNAction.repeatForever(
                    SCNAction.rotateBy(
                        x: 0,
                        y: 2 * Double.pi,
                        z: 0,
                        duration: orbitalDay / 365 * 12 * timeWeight
                    )
                )
            )
            $0.addChildNode(Self.createOrbitLine(radius: radius))
        }
    }
    
    static func makePlanet(
        name: String? = nil,
        radius: CGFloat,
        image: Images
    ) -> SCNNode {
        return SCNNode(geometry: SCNSphere(radius: radius)).apply {
            $0.name = name
            $0.geometry?.firstMaterial?.diffuse.contents = image.uiImage
        }
    }
    
    private static func createOrbitLine(radius: CGFloat, lineWidth: CGFloat = 0.2) -> SCNNode {
        return SCNNode(
            geometry: SCNTube(innerRadius: radius - lineWidth / 2, outerRadius: radius + lineWidth / 2, height: 0.01).apply {
                $0.firstMaterial?.diffuse.contents = UIColor.white
            }
        )
    }
}
