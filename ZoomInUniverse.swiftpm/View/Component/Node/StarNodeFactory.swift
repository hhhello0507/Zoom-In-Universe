//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import Foundation
import SceneKit

enum StarNodeFactory {
    static func makeStarNode(
        radius: CGFloat = 0.1
    ) -> SCNNode {
        let coneSize = radius * .random(in: 8..<12)
        let coneRadius = radius / .random(in: 16..<20)
        let color = randomOverlayedStarColor()
        
        let node = SCNNode(geometry: SCNSphere(radius: radius))
        
        let topCone = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize)
        topCone.firstMaterial?.diffuse.contents = color
        topCone.firstMaterial?.lightingModel = .constant
        let topNode = SCNNode(geometry: topCone)
        topNode.position = SCNVector3(0, radius + coneSize / 2, 0)
        
        let bottomCone = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize)
        bottomCone.firstMaterial?.diffuse.contents = color
        bottomCone.firstMaterial?.lightingModel = .constant
        let bottomNode = SCNNode(geometry: bottomCone)
        bottomNode.position = SCNVector3(0, -(radius + coneSize / 2), 0)
        bottomNode.rotation = SCNVector4(0, 0, 1, Double.pi)
        
        let leftCone = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize)
        leftCone.firstMaterial?.diffuse.contents = color
        leftCone.firstMaterial?.lightingModel = .constant
        let leftNode = SCNNode(geometry: leftCone)
        leftNode.position = SCNVector3(-(radius + coneSize / 2), 0, 0)
        leftNode.rotation = SCNVector4(0, 0, 1, Double.pi / 180 * 90)
        
        let rightCone = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize)
        rightCone.firstMaterial?.diffuse.contents = color
        rightCone.firstMaterial?.lightingModel = .constant
        let rightNode = SCNNode(geometry: rightCone)
        rightNode.position = SCNVector3(radius + coneSize / 2, 0, 0)
        rightNode.rotation = SCNVector4(0, 0, 1, -Double.pi / 180 * 90)
        
        node.geometry?.firstMaterial?.diffuse.contents = color
        node.geometry?.firstMaterial?.lightingModel = .constant
        
        node.addChildNode(topNode)
        node.addChildNode(bottomNode)
        node.addChildNode(leftNode)
        node.addChildNode(rightNode)
        
        return node
    }
}

// Generate Star Color
private func randomOverlayedStarColor() -> UIColor {
    let baseColor = UIColor.white
    let alpha = 0.15
    
    let overlayColors: [UIColor] = [
        UIColor.red,
        UIColor.orange,
        UIColor.yellow,
        UIColor.white,
        UIColor.blue
    ]
    
    let selectedOverlayColor = overlayColors.randomElement()!
    return baseColor.blended(withFraction: alpha, of: selectedOverlayColor) ?? baseColor
}

private extension UIColor {
    /// 색상을 주어진 비율로 혼합하는 메서드
    func blended(withFraction fraction: CGFloat, of color: UIColor) -> UIColor? {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1),
              color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else {
            return nil
        }
        
        let red = r1 * (1 - fraction) + r2 * fraction
        let green = g1 * (1 - fraction) + g2 * fraction
        let blue = b1 * (1 - fraction) + b2 * fraction
//        let alpha = a1 * (1 - fraction) + a2 * fraction
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
