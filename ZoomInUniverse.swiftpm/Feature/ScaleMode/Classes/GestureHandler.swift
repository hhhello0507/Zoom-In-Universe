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
        let hitResults = parent.scnView.hitTest(location, options: [.searchMode: SCNHitTestSearchMode.all.rawValue])
        let hitCustomNodes = hitResults.compactMap { $0.node as? CustomNode }
        let hitCustomNodeNames = hitCustomNodes.map { $0.name }
        
        if gesture.state == .ended || gesture.state == .cancelled {
            parent.scnView.scene?.rootNode.childNodes
                .compactMap { $0 as? CustomNode }
                .forEach { node in
                    if hitCustomNodeNames.contains(node.name) {
                        node.clickUp()
                    } else {
//                        print(node.name)
                        
                        node.cancelClicking()
                    }
                }
            hitCustomNodes.forEach {
                print($0.name)
            }
        }
        
        hitCustomNodes.forEach { node in
            if gesture.state == .began {
                node.clickDown()
            } else if [.ended, .cancelled].contains(gesture.state) {
                node.clickUp()
            }
        }
        
        self.parent.scnView.setNeedsDisplay()
    }
}

extension GestureHandler: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
//        print("\(type(of: gestureRecognizer)), \(type(of: otherGestureRecognizer))")
        // Allow long press and pinch gestures to be recognized simultaneously
        if (gestureRecognizer is UILongPressGestureRecognizer && otherGestureRecognizer is UIPinchGestureRecognizer) ||
            (gestureRecognizer is UIPinchGestureRecognizer && otherGestureRecognizer is UILongPressGestureRecognizer) {
//            print("true")
            return true
        }
//        print("false")
        return false
    }
}
