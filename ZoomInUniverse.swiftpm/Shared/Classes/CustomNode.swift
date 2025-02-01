import Foundation
import SceneKit

class CustomNode: SCNNode {
    private var action: (() -> Void)?
    private var isClicking = false
    
    func addAction(_ action: @escaping () -> Void) {
        self.action = action
    }
    
    func clickDown() {
        guard action != nil else { return }
        isClicking = true
        opacity = 0.4
    }
    
    func clickUp() {
        guard isClicking else { return }
        opacity = 1
        action?()
    }
}

extension CustomNode {
    static func of(_ node: SCNNode) -> CustomNode {
        return CustomNode().apply {
            $0.position = node.position
            $0.rotation = node.rotation
            $0.scale = node.scale
            $0.eulerAngles = node.eulerAngles
            $0.worldPosition = node.worldPosition
            $0.isHidden = node.isHidden
            $0.name = node.name
            $0.light = node.light
            $0.geometry = node.geometry
            $0.opacity = node.opacity
            $0.renderingOrder = node.renderingOrder
            $0.categoryBitMask = node.categoryBitMask
            $0.physicsBody = node.physicsBody
            $0.physicsField = node.physicsField
            $0.constraints = node.constraints
            $0.addChildNodes(node.childNodes)
            if let geometry = node.geometry {
                $0.geometry = geometry.copy() as? SCNGeometry
            }
        }
    }
}
