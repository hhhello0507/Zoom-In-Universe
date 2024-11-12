//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import SceneKit

extension SCNVector3 {
    // MARK: - Operator
    static func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x + right.x, left.y + right.y, left.z + right.z)
    }
    
    static func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }
    
    static func * (vector: SCNVector3, scalar: Float) -> SCNVector3 {
        return SCNVector3(vector.x * scalar, vector.y * scalar, vector.z * scalar)
    }
    
    static func / (vector: SCNVector3, scalar: Float) -> SCNVector3 {
        return SCNVector3(vector.x / scalar, vector.y / scalar, vector.z / scalar)
    }
    
    // MARK: - Random
    static func random(in range: Range<Float>) -> SCNVector3 {
        return SCNVector3(x: .random(in: range), y: .random(in: range), z: .random(in: range))
    }
    
    static func randomRotation() -> SCNVector3 {
        return self.random(in: 0..<(.pi * 2))
    }
}
