import SceneKit

protocol ScaleModeSceneViewProtocol {
    var cameraPosZ: Float { get }
    var scnView: SCNView { get }
    func updateCameraPosZ(_ cameraPosZ: Float)
}
