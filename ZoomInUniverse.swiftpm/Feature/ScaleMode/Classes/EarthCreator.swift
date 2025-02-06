import SceneKit
import SwiftUI

enum EarthCreator {
    static func createCloud() -> SCNNode {
        let particle = SCNParticleSystem().apply {
            $0.birthRate = 5 // 입자 생성 속도
            $0.particleLifeSpan = 10 // 입자가 오래 지속되도록
            $0.particleSize = 1.5 // 입자 크기 조절
            $0.particleColor = UIColor(white: 1.0, alpha: 0.2) // 반투명한 흰색
            $0.blendMode = .screen // 부드러운 블렌딩
            $0.emitterShape = SCNSphere(radius: 1.0) // 구 형태로 배치
        }
        
        return SCNNode().apply {
            $0.addChildNodes(
                Array(repeating: 0, count: 10).map { _ in
                    SCNNode().apply {
                        $0.addParticleSystem(particle)
                        $0.position = .random(in: -5..<5)
                    }
                }
            )
        }
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
