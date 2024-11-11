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
        
        // 1. SCNText 생성 및 기본 설정
        let textGeometry = SCNText(string: name, extrusionDepth: 2.0)
        textGeometry.font = UIFont.systemFont(ofSize: 10)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.white
        
        // 2. 텍스트 중앙 정렬 설정
        textGeometry.alignmentMode = CATextLayerAlignmentMode.center.rawValue
        textGeometry.flatness = 0.1  // 텍스트 품질 조정
        
        // 3. 텍스트 크기 계산 후 중앙 정렬을 위해 pivot 조정
        let (minBound, maxBound) = textGeometry.boundingBox
        let textWidth = maxBound.x - minBound.x
        let textHeight = maxBound.y - minBound.y
        let textDepth = maxBound.z - minBound.z
        
        let textNode = SCNNode(geometry: textGeometry)
        textNode.pivot = SCNMatrix4MakeTranslation(textWidth / 2, textHeight / 2, textDepth / 2)
        textNode.position = SCNVector3(0, radius + 2, 0)
        textNode.scale = SCNVector3(0.3, 0.3, 0.3)  // 크기 조정
        
        // 4. 카메라 방향으로 고정 (BillboardConstraint)
        let billboardConstraint = SCNBillboardConstraint()
        billboardConstraint.freeAxes = [.Y]
        textNode.constraints = [billboardConstraint]
        
        node.addChildNode(textNode)
        
        return node
    }
}
