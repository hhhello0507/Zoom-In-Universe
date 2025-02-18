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
    func addTitle(_ title: String? = nil, fontSize: CGFloat = 5) -> SCNNode {
        // SCNText 생성 및 기본 설정
        let textGeometry = SCNText(string: title ?? name, extrusionDepth: 1.0).apply {
            let fontDescriptor = UIFont.systemFont(ofSize: 10, weight: .bold).fontDescriptor
            let font = UIFont(descriptor: fontDescriptor, size: fontSize)
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
        
        let textNode = SCNNode().apply {
            $0.geometry = textGeometry
            $0.pivot = SCNMatrix4MakeTranslation(textWidth / 2, textHeight / 2, textDepth / 2)
            $0.scale = SCNVector3(0.3, 0.3, 0.3)  // 크기 조정
            $0.position.y = self.boundingBox.max.y + 1 // 머리 위
            
            // 3. 카메라 방향으로 고정 (BillboardConstraint)
            $0.constraints = [
                SCNBillboardConstraint().apply {
                    $0.freeAxes = [.Y]
                }
            ]
            $0.name = self.name
        }
        addChildNodes(
            textNode.apply {
                $0.addChildNode(
                    SCNNode().apply {
                        $0.geometry = SCNPlane(width: CGFloat(textWidth), height: CGFloat(textHeight)).apply {
                            $0.firstMaterial?.diffuse.contents = UIColor.clear
                        }
                        $0.position = SCNVector3(textWidth / 2, textHeight, textDepth / 2)
                        $0.name = self.name
                    }
                )
            }
        )
        return textNode
    }
    
    func setAllName(_ name: String) {
        self.name = name
        self.childNodes.forEach {
            $0.setAllName(name)
        }
    }
    
    func setAllName(_ nodeType: NodeType) {
        self.setAllName(nodeType.rawValue)
    }
}

extension SCNNode {
    private struct AssociatedKeys {
        static var actionKey = "actionKey"
        static var isClickingKey = "isClickingKey"
    }
    
    private var action: (() -> Void)? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? (() -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    private var isClicking: Bool {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.isClickingKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.isClickingKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addAction(_ action: @escaping () -> Void) {
        self.action = action
        self.childNodes.forEach { node in
            node.addAction(action)
        }
    }
    
    func clickDown() {
        guard action != nil, name != nil else { return }
        self.isClicking = true
        self.opacity = 0.4
        
        self.childNodes.forEach { node in
            node.clickDown()
        }
    }
    
    func clickUp(clicked: Bool = false) {
        guard name != nil else { return }
        self.opacity = 1
        
        var clicked = clicked
        
        if isClicking && !clicked {
            self.action?()
            clicked = true
        }
        
        self.isClicking = false
        
        self.childNodes.forEach { node in
            node.clickUp(clicked: clicked)
        }
    }
    
    func cancelClicking() {
        guard name != nil else { return }
        self.opacity = 1
        self.isClicking = false
        
        self.childNodes.forEach { node in
            node.cancelClicking()
        }
    }
}

extension SCNNode: @retroactive Identifiable {
}
