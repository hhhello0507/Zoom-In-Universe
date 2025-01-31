import Foundation
import SceneKit

class CustomNode: SCNNode {
    private var action: (() -> Void)?
    private var isClicking = false
    
    convenience init(from node: SCNNode) {
        self.init()
        self.position = node.position
        self.rotation = node.rotation
        self.scale = node.scale
        self.eulerAngles = node.eulerAngles
        self.worldPosition = node.worldPosition
        self.isHidden = node.isHidden
        self.name = node.name
        self.light = node.light
        self.geometry = node.geometry
        self.opacity = node.opacity
        self.renderingOrder = node.renderingOrder
        self.categoryBitMask = node.categoryBitMask
        self.physicsBody = node.physicsBody
        self.physicsField = node.physicsField
        self.constraints = node.constraints
        self.addChildNodes(node.childNodes)
        if let geometry = node.geometry {
            self.geometry = geometry.copy() as? SCNGeometry
        }
    }
    
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
