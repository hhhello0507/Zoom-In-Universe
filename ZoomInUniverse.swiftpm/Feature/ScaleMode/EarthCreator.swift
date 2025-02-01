import SceneKit
import SwiftUI

enum EarthCreator {
    static func createComplexCloud() -> SCNNode {
        let cloudNode = SCNNode()

        // 여러 개의 Sphere를 조합하여 구름 형태 생성
        let sphere1 = SCNSphere(radius: 1.0)
        sphere1.segmentCount = 36
        let sphereNode1 = SCNNode(geometry: sphere1)
        sphereNode1.position = SCNVector3(-1.0, 0.0, 0.0)

        let sphere2 = SCNSphere(radius: 0.8)
        sphere2.segmentCount = 36
        let sphereNode2 = SCNNode(geometry: sphere2)
        sphereNode2.position = SCNVector3(1.0, 0.5, 0.0)

        let sphere3 = SCNSphere(radius: 0.6)
        sphere3.segmentCount = 36
        let sphereNode3 = SCNNode(geometry: sphere3)
        sphereNode3.position = SCNVector3(0.0, -0.5, 0.0)

        // 머티리얼 설정
        let cloudMaterial = SCNMaterial()
        cloudMaterial.diffuse.contents = UIColor.white
//        cloudMaterial.transparency = 0.8
//        cloudMaterial.lightingModel = .lambert

        sphere1.materials = [cloudMaterial]
        sphere2.materials = [cloudMaterial]
        sphere3.materials = [cloudMaterial]

        // 구름 노드에 Sphere 추가
        cloudNode.addChildNode(sphereNode1)
        cloudNode.addChildNode(sphereNode2)
        cloudNode.addChildNode(sphereNode3)

        return cloudNode
    }
    
    static func createGround(
        color: Color = .green
    ) -> SCNNode {
        let radius: CGFloat = 5.0 // 원형 지면의 반지름
        let height: CGFloat = 0.2 // 원형 지면의 두께 (낮게 설정하여 평면처럼 보이게 함)
        let cylinderGeometry = SCNCylinder(radius: radius, height: height)

        // 원통 노드 생성
        let cylinderNode = SCNNode(geometry: cylinderGeometry)

        // 원통의 위치 설정 (Scene의 중심에 배치)
        cylinderNode.position = SCNVector3(0, -height / 2, 0) // 지면이 y=0에 위치하도록 조정

        // 원통의 머티리얼 설정 (예: 초록색 지면)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(color) // 초록색 설정
        cylinderGeometry.materials = [material]
        
        return cylinderNode
    }
}
