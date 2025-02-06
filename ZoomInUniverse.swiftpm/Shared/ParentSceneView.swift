import SceneKit

protocol ScaleModeSceneViewProtocol {
    var camera: SCNNode { get }
    var scnView: SCNView { get }
    func updateCameraPosZ(_ cameraPosZ: Float)
}
