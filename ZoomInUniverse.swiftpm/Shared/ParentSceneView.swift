import SceneKit

protocol ScaleModeSceneView {
    var cameraPosZ: Float { get }
    var scnView: SCNView { get }
    func updateCameraPosZ(_ cameraPosZ: Float)
}
