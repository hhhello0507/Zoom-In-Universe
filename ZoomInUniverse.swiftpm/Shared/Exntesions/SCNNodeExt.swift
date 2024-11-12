//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation
import SceneKit

extension SCNNode {
    func addDirectionIndicator(for rootNode: SCNNode, radius: CGFloat = 0.25, size: CGFloat = 10) {
#if DEBUG
        // X Axis
        let xNode = SCNNode()
        xNode.worldPosition = self.worldPosition
        xNode.rotation = self.rotation
        xNode.simdOrientation = xNode.simdOrientation * simd_quatf(angle: Float.pi / 2, axis: simd_float3(0, 0, 1))
        
        let xArrowGeometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size)
        xArrowGeometry.firstMaterial?.diffuse.contents = UIColor.red
        
        let xArrowNode = SCNNode(geometry: xArrowGeometry)
        xArrowNode.position = SCNVector3(0, -size / 2, 0)
        xNode.addChildNode(xArrowNode)
        rootNode.addChildNode(xNode)
        
        // Y Axis
        let yNode = SCNNode()
        yNode.worldPosition = self.worldPosition
        yNode.rotation = self.rotation
        
        let yArrowGeometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size)
        yArrowGeometry.firstMaterial?.diffuse.contents = UIColor.green
        
        let yArrowNode = SCNNode(geometry: yArrowGeometry)
        yArrowNode.position = SCNVector3(0, size / 2, 0)
        yArrowNode.eulerAngles = .init(0, 0, Double.pi)
        yNode.addChildNode(yArrowNode)
        rootNode.addChildNode(yNode)
        
        // Z Axis
        let zNode = SCNNode()
        zNode.worldPosition = self.worldPosition
        zNode.rotation = self.rotation
        zNode.simdOrientation = zNode.simdOrientation * simd_quatf(angle: Float.pi / 2, axis: simd_float3(1, 0, 0))
        
        let zArrowGeometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size)
        zArrowGeometry.firstMaterial?.diffuse.contents = UIColor.blue
        
        let zArrowNode = SCNNode(geometry: zArrowGeometry)
        zArrowNode.position = SCNVector3(0, -size / 2, 0)
        zNode.addChildNode(zArrowNode)
        rootNode.addChildNode(zNode)
#endif
    }
    
    func addBloomEffect(intensity: Double = 3, radius: Double = 10) {
        if let filter = CIFilter(name: "CIBloom", parameters: [
            kCIInputIntensityKey: intensity, // 빛의 강도
            kCIInputRadiusKey: radius, // 빛 퍼짐 반경
        ]) {
            self.filters = [filter]
        }
    }
}
