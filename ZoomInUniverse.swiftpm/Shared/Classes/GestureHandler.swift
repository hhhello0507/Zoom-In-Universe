import Foundation
import SceneKit
import SwiftUI

class GestureHandler: NSObject {
    let parent: ScaleModeSceneView
    
    init(parent: ScaleModeSceneView) {
        self.parent = parent
    }
    
    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
        let scale = Float(gesture.scale)
        let deltaZ = (1.0 - scale) * 100
        
        self.parent.updateCameraPosZ(self.parent.cameraPosZ + deltaZ)
        
        parent.scnView.setNeedsDisplay()
        gesture.scale = 1.0
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: parent.scnView)
        let hitResults = parent.scnView.hitTest(location, options: [.searchMode: SCNHitTestSearchMode.all.rawValue])
        
        hitResults.forEach { result in
            if let node = result.node as? CustomNode {
                if gesture.state == .began {
                    node.clickDown()
                } else if [.ended, .cancelled].contains(gesture.state) {
                    node.clickUp()
                }
            }
        }
        
        if gesture.state == .ended || gesture.state == .cancelled {
            parent.scnView.scene?.rootNode.childNodes
                .compactMap { $0 as? CustomNode }
                .forEach { node in
                DispatchQueue.main.async {
                    node.clickUp()
                }
            }
        }
        
        parent.scnView.setNeedsDisplay()
    }
}

extension GestureHandler: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Allow long press and pinch gestures to be recognized simultaneously
        if gestureRecognizer is UILongPressGestureRecognizer && otherGestureRecognizer is UIPinchGestureRecognizer {
            return true
        }
        return false
    }
}
