import Foundation
import SceneKit
import SwiftUI

class GestureHandler: NSObject {
    let parent: ScaleModeSceneViewProtocol
    
    init(parent: ScaleModeSceneViewProtocol) {
        self.parent = parent
    }
    
    @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
        let scale = Float(gesture.scale)
        let deltaZ = (1.0 - scale) * 100
        
        self.parent.updateCameraPosZ(self.parent.camera.position.z + deltaZ)
        
        gesture.scale = 1.0
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: parent.scnView)
        let hitResults = parent.scnView.hitTest(location, options: [.searchMode: SCNHitTestSearchMode.any.rawValue])
        
        let hitResult = hitResults.first
        let hitNode = hitResult?.node
        
        if [.ended, .cancelled].contains(gesture.state) {
            // 3 Depth 까지 탐색
            parent.scnView.scene?.rootNode.childNodes.flatMap { [$0] + $0.childNodes.flatMap { [$0] + $0.childNodes } }
                .forEach { node in
                    if hitNode?.name == node.name {
                        node.clickUp()
                    } else {
                        node.cancelClicking()
                    }
                }
        }
        
        if gesture.state == .began {
            hitNode?.clickDown()
        } else if [.ended, .cancelled].contains(gesture.state) {
            hitNode?.clickUp()
        }
        
        self.parent.scnView.setNeedsDisplay()
    }
}

extension GestureHandler: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        // Allow long press and pinch gestures to be recognized simultaneously
        (gestureRecognizer is UILongPressGestureRecognizer && otherGestureRecognizer is UIPinchGestureRecognizer) ||
        (gestureRecognizer is UIPinchGestureRecognizer && otherGestureRecognizer is UILongPressGestureRecognizer)
    }
}
