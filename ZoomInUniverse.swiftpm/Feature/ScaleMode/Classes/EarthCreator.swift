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
    
    static func createGround(materialContents: Any?) -> SCNNode {
        let height: CGFloat = 0.2 // 원형 지면의 두께 (낮게 설정하여 평면처럼 보이게 함)

        // 원통 노드 생성
        return SCNNode().apply {
            $0.geometry = SCNCylinder(radius: 5, height: height).apply {
                $0.materials = [
                    SCNMaterial().apply {
                        $0.diffuse.contents = materialContents
                    }
                ]
            }
            $0.position = SCNVector3(0, -height / 2, 0) // 지면이 y=0에 위치하도록 조정
        }
    }
}
