//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/12/24.
//

import Foundation
import SceneKit

enum StarNodeFactory {
    static func makeStarNode(radius: CGFloat = 0.1) -> SCNNode {
        let coneSize = radius * .random(in: 8..<12)
        let coneRadius = radius / .random(in: 16..<20)
        let color = randomOverlayedStarColor()
        
        return SCNNode(geometry: SCNSphere(radius: radius)).apply {
            $0.geometry?.firstMaterial?.diffuse.contents = color
            $0.geometry?.firstMaterial?.lightingModel = .constant
            $0.addChildNodes(
                // top
                SCNNode().apply {
                    $0.geometry = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize).apply {
                        $0.firstMaterial?.diffuse.contents = color
                        $0.firstMaterial?.lightingModel = .constant
                    }
                    $0.position = SCNVector3(0, radius + coneSize / 2, 0)
                },
                // bottom
                SCNNode().apply {
                    $0.geometry = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize).apply {
                        $0.firstMaterial?.diffuse.contents = color
                        $0.firstMaterial?.lightingModel = .constant
                    }
                    $0.position = SCNVector3(0, -(radius + coneSize / 2), 0)
                    $0.rotation = SCNVector4(0, 0, 1, Double.pi)
                },
                // left
                SCNNode().apply {
                    $0.geometry = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize).apply {
                        $0.firstMaterial?.diffuse.contents = color
                        $0.firstMaterial?.lightingModel = .constant
                    }
                    $0.position = SCNVector3(-(radius + coneSize / 2), 0, 0)
                    $0.rotation = SCNVector4(0, 0, 1, Double.pi / 180 * 90)
                },
                // right
                SCNNode().apply {
                    $0.geometry = SCNCone(topRadius: 0, bottomRadius: coneRadius, height: coneSize).apply {
                        $0.firstMaterial?.diffuse.contents = color
                        $0.firstMaterial?.lightingModel = .constant
                    }
                    $0.position = SCNVector3(radius + coneSize / 2, 0, 0)
                    $0.rotation = SCNVector4(0, 0, 1, -Double.pi / 180 * 90)
                }
            )
        }
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
