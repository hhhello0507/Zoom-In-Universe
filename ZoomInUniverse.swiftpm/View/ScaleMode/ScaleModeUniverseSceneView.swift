import SwiftUI
import SceneKit

struct ScaleModeUniverseSceneView: UIViewRepresentable, ScaleModeSceneView {
    static let cameraOffsetPosZ: Float = 25
    static var cameraStartPosZ: Float?
    static let defaultBackground = Images.space.uiImage
    
    // MARK: Parameter
    let scnView: SCNView
    @Binding var cameraPosZ: Float
    
    // MARK: Property
    let scene = SCNScene()
    let camera = SCNNode()
        .set(\.camera, SCNCamera()
            .set(\.zFar, 10000)
            .set(\.zNear, 0.01))
    
    let earthWrapperNode = SCNNode()
    let moonNode = Nodes.moon.node.apply {
        $0.position = SCNVector3(10, 8, 0)
        $0.addTitle()
    }
    let earthNode = Nodes.earth.node
        .set(\.position.y, -7)
    let stratosphere = SCNNode().apply {
        $0.addTitle("Stratosphere")
    }
    let mesosphere = SCNNode().apply {
        $0.addTitle("Mesosphere")
    }
    let thermosphere = SCNNode().apply {
        $0.addTitle("Thermosphere")
    }
    let startNode = SCNNode()
    
    init(
        scnView: SCNView,
        cameraPosZ: Binding<Float>
    ) {
        self.scnView = scnView
        self._cameraPosZ = cameraPosZ
        
        self.setupNodes()
        self.setupScene()
        self.addAction()
    }
    
    // MARK: Override method
    func makeUIView(context: Context) -> SCNView {
        let coordinator = context.coordinator
        
        let longPressGesture = UILongPressGestureRecognizer(target: coordinator.gestureHandler, action: #selector(coordinator.gestureHandler.handleLongPressGesture(_:))).apply {
            $0.minimumPressDuration = 0
            $0.delegate = coordinator.gestureHandler
        }
        let pinchGesture = UIPinchGestureRecognizer(target: coordinator.gestureHandler, action: #selector(coordinator.gestureHandler.handlePinchGesture(_:))).apply {
            $0.delegate = coordinator.gestureHandler
        }
        
        return scnView
            .set(\.scene, scene)
            .set(\.pointOfView, camera)
            .set(\.autoenablesDefaultLighting, true)
            .set(\.delegate, coordinator)
            .set(\.isUserInteractionEnabled, true)
            .apply {
                $0.addGestureRecognizer(pinchGesture)
                $0.addGestureRecognizer(longPressGesture)
            }
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func updateCameraPosZ(_ cameraPosZ: Float) {
        self.camera.position.z = cameraPosZ
        self.cameraPosZ = cameraPosZ
        
        UIView.animate(withDuration: 2) {
            if self.cameraPosZ < self.stratosphere.position.z {
                scene.background.contents = UIColor(0xB0E5FF)
            } else if self.cameraPosZ < self.mesosphere.position.z {
                scene.background.contents = UIColor(0x3D5466)
            } else if self.cameraPosZ < self.thermosphere.position.z {
                scene.background.contents = UIColor(0x1F2831)
            } else {
                scene.background.contents = Self.defaultBackground
            }
        }
    }
    
    // MARK: Method
    func setupNodes() {
        self.earthWrapperNode.addChildNodes(earthNode, moonNode)
    }
    
    func setupScene() {
        let objects = [
            SCNNode().apply {
                $0.addTitle("Quark")
            },
            SCNNode().apply {
                $0.addChildNodes(
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Proton")
                        $0.position = SCNVector3(-3, 6, 0)
                    },
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Neutron")
                        $0.position = SCNVector3(2, 0, 0)
                    },
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Electron")
                        $0.position = SCNVector3(0, -3, 0)
                    }
                )
            },
            SCNNode().apply {
                $0.addTitle("Atom")
            },
            SCNNode().apply {
                $0.addTitle("Molecule")
            },
            SCNNode().apply {
                $0.addTitle("Human")
            },
            EarthCreator.createGround(color: .blue.opacity(0.3)).apply {
                $0.position = SCNVector3(0, -3, 0)
                $0.eulerAngles = SCNVector3(Double.pi * 2 / 30, 0, 0)
                $0.addTitle("Ocean")
            },
//            startNode,
            EarthCreator.createGround().apply {
                $0.position = SCNVector3(0, -3, 0)
                $0.eulerAngles = SCNVector3(Double.pi * 2 / 30, 0, 0)
                $0.addTitle("Continent")
            },
            earthNode,
            EarthCreator.createComplexCloud().apply {
                $0.addTitle("Troposphere")
            },
            SCNNode().apply {
                $0.addChildNode(
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Airplain")
                    }
                )
            },
            stratosphere,
            mesosphere,
            SCNNode().apply {
                $0.addChildNodes(
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Aurora")
                        $0.position = SCNVector3(-3, 3, 0)
                    },
                    DummyCreator.createDummy().apply {
                        $0.addTitle("Artificial Satellite")
                        $0.position = SCNVector3(2, -5, 0)
                    }
                )
            },
            thermosphere,
//            startNode,
            Nodes.solarSystem.node.apply {
                $0.scale = SCNVector3(0.1, 0.1, 0.1)
                $0.eulerAngles = SCNVector3(
                    Double.pi / 180 * 30,
                    0,
                    Double.pi / 180 * 30
                )
                $0.position = SCNVector3(4, 0, 0)
                $0.addTitle().let {
                    $0.scale = SCNVector3(1, 1, 1)
                    $0.position.y += 8
                }
            },
            Nodes.starCluster.node.apply {
                $0.addTitle()
            },
            // BlackHole
            CustomNode().apply {
                $0.eulerAngles = SCNVector3(Double.pi / 180 * 10, 0, Double.pi / 180 * 10)
                $0.addChildNode(
                    Nodes.blackHole.node.apply {
                        $0.addBloomEffect()
                        $0.scale = SCNVector3(0.03, 0.03, 0.03)
                        $0.runAction(
                            SCNAction.repeatForever(
                                SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 1)
                            )
                        )
                    }
                )
                $0.addTitle("Black Hole")
            },
            // Galaxy
            CustomNode().apply {
                $0.eulerAngles = SCNVector3(-Double.pi / 180 * 64, Double.pi / 180 * 30, 0)
                $0.addChildNode(
                    Nodes.galaxy.node.apply {
                        $0.scale = SCNVector3(0.2, 0.2, 0.2)
                        $0.runAction(
                            SCNAction.repeatForever(
                                SCNAction.rotateBy(x: 0, y: 0, z: 2 * .pi, duration: 20)
                            )
                        )
                    }
                )
                $0.addTitle("Galaxy")
            },
            // GalaxyCluster
            SCNNode().apply {
                $0.addChildNodes(
                    Array(repeating: 0, count: 8).map { _ in
                        SCNNode().apply {
                            $0.eulerAngles = .randomRotation()
                            $0.position = .random(in: -6..<6)
                            $0.addChildNode(
                                Nodes.galaxy.node.apply {
                                    $0.scale = SCNVector3(0.01, 0.01, 0.01)
                                    $0.runAction(
                                        SCNAction.repeatForever(
                                            SCNAction.rotateBy(x: 0, y: 0, z: 2 * .pi, duration: 20)
                                        )
                                    )
                                }
                            )
                        }
                    }
                )
                $0.addTitle("GalaxyCluster")
            },
            CustomNode().apply {
                $0.geometry = SCNSphere(radius: 10).apply {
                    $0.firstMaterial?.diffuse.contents = Images.cosmicWeb.uiImage
                }
                $0.addTitle("Cosmic Web")
            },
            CustomNode().apply {
                $0.geometry = SCNSphere(radius: 10).apply {
                    $0.firstMaterial?.diffuse.contents = Images.universe.uiImage
                }
                $0.position = SCNVector3(0, 0, 100)
                $0.addTitle("Universe")
            },
            CustomNode().apply {
                let radius = 10.0
                let geometry = SCNSphere(radius: CGFloat(radius)).apply {
                    $0.firstMaterial?.diffuse.contents = Images.universe.uiImage
                }
                $0.position = SCNVector3(0, 0, 300)
                $0.eulerAngles = SCNVector3(0, 0, 45)
                
                let n = 40
                let offset = Double(n - 1) * radius
                
                for i in 0..<n {
                    for j in 0..<n {
                        let model = SCNNode(geometry: geometry)
                        let x = radius * (Double(i) - 1) * 2 + radius - offset
                        let y = radius * (Double(j) - 1) * 2 + radius - offset
                        //                print(x, y)
                        if x * x + y * y <= 250 * 250 {
                            model.position = SCNVector3(x, y, 0)
                            model.eulerAngles = .randomRotation()
                            model.runAction(
                                SCNAction.repeatForever(
                                    SCNAction.rotateBy(x: 2 * .pi, y: 2 * .pi, z: 2 * .pi, duration: 20)
                                )
                            )
                            $0.addChildNode(model)
                        }
                    }
                }
                $0.addTitle("Multiverse")
            },
            startNode
        ]
        
        objects.enumerated().forEach { index, object in
            object.let {
                $0.position.z += Float(index) * 100
            }
        }
        
        Self.cameraStartPosZ = startNode.position.z + Self.cameraOffsetPosZ
        camera.position.z = Self.cameraStartPosZ!
        DispatchQueue.main.async {
            cameraPosZ = camera.position.z
        }
        
        scene.let {
            $0.background.contents = Images.space.uiImage
            $0.rootNode.addChildNodes(objects)
        }
    }
    
    func addAction() {
        
    }
}

// MARK: - Coordinator
extension ScaleModeUniverseSceneView {
    class Coordinator: NSObject {
        let parent: ScaleModeUniverseSceneView
        let gestureHandler: GestureHandler
        
        init(parent: ScaleModeUniverseSceneView) {
            self.parent = parent
            self.gestureHandler = GestureHandler(parent: parent)
        }
    }
}

extension ScaleModeUniverseSceneView.Coordinator: SCNSceneRendererDelegate {
}
