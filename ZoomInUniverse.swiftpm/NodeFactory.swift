import SceneKit

enum NodeFactory {
    /// | orbitalDay - ex. Earch orbital days is 365.
    static func makePlanetOrbit(orbitalDay: Double) -> SCNNode {
        let node = SCNNode()
        
        let orbitAction = SCNAction.repeatForever(
            SCNAction.rotateBy(
                x: 0,
                y: 2 * Double.pi,
                z: 0,
                duration: orbitalDay / 365 * 12
            )
        )
        node.runAction(orbitAction)
        
        return node
    }
    
    static func makePlanet(
        name: String? = nil,
        radius: CGFloat,
        image: UIImage?,
        position: SCNVector3
    ) -> SCNNode {
        let node = SCNNode(geometry: SCNSphere(radius: radius))
        node.name = name
        node.geometry?.firstMaterial?.diffuse.contents = image
        node.position = position
        
        return node
    }
}
