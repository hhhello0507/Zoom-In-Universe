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
        rootNode.addChildNodes(
            // X Axis
            SCNNode().apply {
                $0.worldPosition = self.worldPosition
                $0.rotation = self.rotation
                $0.simdOrientation = $0.simdOrientation * simd_quatf(angle: Float.pi / 2, axis: simd_float3(0, 0, 1))
                $0.addChildNode(
                    SCNNode().apply {
                        $0.geometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size).apply {
                            $0.firstMaterial?.diffuse.contents = UIColor.red
                        }
                        $0.position = SCNVector3(0, -size / 2, 0)
                    }
                )
            },
            // Y Axis
            SCNNode().apply {
                $0.worldPosition = self.worldPosition
                $0.rotation = self.rotation
                $0.addChildNode(
                    SCNNode().apply {
                        $0.geometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size).apply {
                            $0.firstMaterial?.diffuse.contents = UIColor.green
                        }
                        $0.position = SCNVector3(0, size / 2, 0)
                        $0.eulerAngles = .init(0, 0, Double.pi)
                    }
                )
            },
            // Z Axis
            SCNNode().apply {
                $0.worldPosition = self.worldPosition
                $0.rotation = self.rotation
                $0.simdOrientation = $0.simdOrientation * simd_quatf(angle: Float.pi / 2, axis: simd_float3(1, 0, 0))
                $0.addChildNode(
                    SCNNode().apply {
                        $0.geometry = SCNCone(topRadius: 0, bottomRadius: radius, height: size).apply {
                            $0.firstMaterial?.diffuse.contents = UIColor.blue
                        }
                        $0.position = SCNVector3(0, -size / 2, 0)
                    }
                )
            }
        )
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
    
    @inlinable
    func addChildNodes(_ children: SCNNode...) {
        children.forEach {
            self.addChildNode($0)
        }
    }
    
    @inlinable
    func addChildNodes(_ children: [SCNNode]) {
        children.forEach {
            self.addChildNode($0)
        }
    }
    
    @discardableResult
    func addTitle(_ title: String? = nil) -> SCNNode {
        // SCNText 생성 및 기본 설정
        let textGeometry = SCNText(string: title ?? name, extrusionDepth: 2.0).apply {
            let fontDescriptor = UIFont.systemFont(ofSize: 10, weight: .bold).fontDescriptor
            let font = UIFont(descriptor: fontDescriptor, size: 10)
            $0.font = font
            $0.firstMaterial?.diffuse.contents = UIColor.white
            $0.alignmentMode = CATextLayerAlignmentMode.center.rawValue
            $0.flatness = 0.1
        }
        
        // 텍스트 크기 계산 후 중앙 정렬을 위해 pivot 조정
        let (minBound, maxBound) = textGeometry.boundingBox
        let textWidth = maxBound.x - minBound.x
        let textHeight = maxBound.y - minBound.y
        let textDepth = maxBound.z - minBound.z
        
        let textNode = SCNNode(geometry: textGeometry).apply {
            $0.pivot = SCNMatrix4MakeTranslation(textWidth / 2, textHeight / 2, textDepth / 2)
            $0.scale = SCNVector3(0.3, 0.3, 0.3)  // 크기 조정
            $0.position.y = self.boundingBox.max.y + 2 // 머리 위
            
            // 3. 카메라 방향으로 고정 (BillboardConstraint)
            $0.constraints = [
                SCNBillboardConstraint().apply {
                    $0.freeAxes = [.Y]
                }
            ]
        }
        addChildNode(textNode)
        return textNode
    }
    
    func setAllName(_ name: String) {
        self.name = name
        self.childNodes.forEach {
            $0.name = name
            $0.setAllName(name)
        }
    }
}
