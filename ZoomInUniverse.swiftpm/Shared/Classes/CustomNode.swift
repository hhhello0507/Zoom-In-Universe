import Foundation
import SceneKit

class CustomNode: SCNNode {
    private var action: (() -> Void)?
    private var isClicking = false
    
    private var customChildNodes: [CustomNode] {
        self.childNodes.compactMap { $0 as? CustomNode }
    }
    
    func addAction(_ action: @escaping () -> Void) {
        self.action = action
        self.customChildNodes.forEach {
            $0.addAction(action)
        }
    }
    
    func clickDown() {
        guard action != nil else { return }
        isClicking = true
        opacity = 0.4
        
        self.customChildNodes.forEach {
            $0.clickDown()
        }
    }
    
    func clickUp() {
        guard isClicking else { return }
        opacity = 1
        isClicking = false
        action?()
        
        self.customChildNodes.forEach {
            $0.clickUp()
        }
    }
    
    func cancelClicking() {
        opacity = 1
        isClicking = false
        
        self.customChildNodes.forEach {
            $0.cancelClicking()
        }
    }
    
    override func addChildNode(_ child: SCNNode) {
//        print("\(child.name)")
        super.addChildNode(
            CustomNode.of(child)
        )
    }
}

extension CustomNode {
    static func of(_ node: SCNNode) -> CustomNode {
        return CustomNode().apply { customNode in
            customNode.name = node.name
            customNode.light = node.light
            customNode.camera = node.camera
            customNode.geometry = node.geometry
            customNode.skinner = node.skinner
            customNode.morpher = node.morpher
            customNode.position = node.position
            customNode.rotation = node.rotation
            customNode.orientation = node.orientation
            customNode.eulerAngles = node.eulerAngles
            customNode.scale = node.scale
            customNode.pivot = node.pivot
            customNode.isHidden = node.isHidden
            customNode.opacity = node.opacity
            customNode.renderingOrder = node.renderingOrder
            customNode.castsShadow = node.castsShadow
            customNode.movabilityHint = node.movabilityHint
            customNode.physicsBody = node.physicsBody
            customNode.physicsField = node.physicsField
            customNode.constraints = node.constraints
            customNode.filters = node.filters
            customNode.isPaused = node.isPaused
            customNode.categoryBitMask = node.categoryBitMask
            customNode.addChildNodes(node.childNodes.map {
                CustomNode.of($0)
            })
            node.particleSystems?.forEach {
                customNode.addParticleSystem($0)
            }
            node.audioPlayers.forEach {
                customNode.addAudioPlayer($0)
            }
            node.actionKeys.forEach {
                if let action = node.action(forKey: $0) {
                    customNode.runAction(action)
                }
            }
        }
    }
}
