//
//  SceneModel.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/10/24.
//

import Foundation
import SceneKit

final class SceneModel: NSObject, ObservableObject {
    @Published var previousZoomLevel: CGFloat = 0
    @Published var clickedNode: SCNNode?
}
