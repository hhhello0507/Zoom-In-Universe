import SwiftUI
import SceneKit

struct ScaleModeSceneView: UIViewRepresentable, ScaleModeSceneViewProtocol {
    static let cameraOffsetPosZ: Float = 25
    static var cameraStartPosZ: Float?
    
    // MARK: Parameter
    let scnView: SCNView
    @Binding var cameraPosZ: Float
    
    // MARK: Property
    let scene = SCNScene()
    let camera = SCNNode()
        .set(\.camera, SCNCamera()
            .set(\.zFar, 10000)
            .set(\.zNear, 0.01))
    
    // nodes
    let quark = SCNNode().apply {
        $0.addTitle("Quark")
    }
    let neutrons = CustomNode().apply {
        $0.addChildNodes(
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.red
                }
                $0.position.z += 0.4
            },
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.red
                }
                $0.position.x += 1.5
                $0.position.y += 0.8
            },
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.red
                }
                $0.position.y -= 1.8
            },
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.red
                }
                $0.position.x -= 1.5
                $0.position.y += 0.8
            },
            SCNNode().apply {
                $0.geometry = SCNTube(innerRadius: 0, outerRadius: 0.1, height: 10).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.blue
                }
            }
        )
        $0.addTitle("Neutron").let {
            $0.position.y -= 10
            $0.position.x += 10
        }
    }
    let protons = CustomNode().apply {
        $0.addChildNodes(
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.blue
                }
                $0.position.y += 1.4
            },
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.blue
                }
                $0.position.y -= 1
                $0.position.x += 1.4
            },
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.blue
                }
                $0.position.y -= 1
                $0.position.x -= 1.4
            }
        )
        $0.addTitle("Proton").let {
            $0.position.y -= 10
            $0.position.x -= 10
        }
    }
    let earthWrapperNode = SCNNode()
    let moonNode = Nodes.moon.node.apply {
        $0.position = SCNVector3(10, 8, 0)
        $0.addTitle()
    }
    let continent = EarthCreator.createGround().apply {
        $0.position = SCNVector3(0, -3, 0)
        $0.eulerAngles = SCNVector3(Double.pi * 2 / 30, 0, 0)
        $0.addTitle("Continent")
    }
    let earthNode = Nodes.earth.node.apply {
        $0.position.y -= 7
        $0.addTitle()
    }
    let troposphere = EarthCreator.createComplexCloud().apply {
        $0.addTitle("Troposphere")
    }
    let airplain = SCNNode().apply {
        $0.addChildNode(
            DummyCreator.createDummy().apply {
                $0.addTitle("Airplain")
            }
        )
    }
    let stratosphere = SCNNode().apply {
        $0.addTitle("Stratosphere")
    }
    let mesosphere = SCNNode().apply {
        $0.addTitle("Mesosphere")
    }
    let artificialSatellite = SCNNode().apply {
        $0.addChildNodes(
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.aurora.node.apply {
                        $0.scale = SCNVector3(0.01, 0.01, 0.01)
                        $0.position = SCNVector3(-3, 4, 0)
                    }
                )
                $0.addTitle("Aurora")
            },
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.artificialSatellites.node.apply {
                        $0.scale = SCNVector3(0.02, 0.02, 0.02)
                        $0.position = SCNVector3(2, -4.5, 0)
                        $0.eulerAngles = SCNVector3(
                            Double.pi / 180 * 30,
                            Double.pi / 180 * -90,
                            0
                        )
                    }
                )
                $0.addTitle("Artificial Satellites").let {
                    $0.position.y -= 20
                }
            }
        )
    }
    let thermosphere = SCNNode().apply {
        $0.addTitle("Thermosphere")
    }
    let spaceBackground = GlobalCreator.createBackground(radiusOffset: 4, contents: Images.space.uiImage)
    let solarSystem = Nodes.solarSystem.node.apply {
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
    }
    let starCluster = Nodes.starCluster.node.apply {
        $0.addTitle("Star Cluster")
    }
    let blackHole = CustomNode().apply {
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
    }
    let galaxy = CustomNode().apply {
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
    }
    let galaxyCluster = SCNNode().apply {
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
    }
    let cosmicWebBackground = GlobalCreator.createBackground(radiusOffset: 5, contents: Images.cosmicWeb.uiImage, size: 300)
    let cosmicWeb = CustomNode().apply {
        $0.addTitle("Cosmic Web")
    }
    let universeBackground = GlobalCreator.createBackground(radiusOffset: 6, contents: UIColor.white)
    let universe = CustomNode().apply {
        $0.addTitle("Universe")
    }
    let startNode = SCNNode()
    
    // MARK: Initializer
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
        
        UIView.transition(with: scnView, duration: 1) {
            scene.background.contents = switch self.cameraPosZ {
            case  ..<self.stratosphere.position.z:
                UIColor(0xB0E5FF)
            case ..<self.mesosphere.position.z:
                UIColor(0x3D5466)
//            case ..<self.thermosphere.position.z:
            default:
                UIColor(0x1F2831)
//            default:
//                nil
            }
        }
    }
    
    // MARK: Method
    func setupNodes() {
        self.earthWrapperNode.addChildNodes(earthNode, moonNode)
    }
    
    func setupScene() {
        let objects = [
            quark,
            SCNNode().apply {
                $0.addChildNodes(
                    neutrons,
                    protons
                )
                $0.addTitle("Atom").let {
                    $0.position.y += 10
                }
            },
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.molecule.node.apply {
                        $0.scale = SCNVector3(0.1, 0.1, 0.1)
                    }
                )
                $0.addTitle("Molecule")
            },
            startNode,
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.male.node.apply {
                        $0.scale = SCNVector3(0.1, 0.1, 0.1)
                        $0.position.y -= 10
                    }
                )
                $0.addTitle("Human").let {
                    $0.position.y += 5
                }
                $0.position.y -= 10
            },
            EarthCreator.createGround(color: .blue.opacity(0.3)).apply {
                $0.position = SCNVector3(0, -3, 0)
                $0.eulerAngles = SCNVector3(Double.pi * 2 / 30, 0, 0)
                $0.addTitle("Ocean")
            },
//            startNode, //
            continent,
            earthNode,
            troposphere,
            airplain,
            stratosphere,
            mesosphere,
            spaceBackground,
            artificialSatellite,
            thermosphere,
//            startNode, //
            solarSystem,
            starCluster,
            blackHole,
            galaxy,
            galaxyCluster,
            cosmicWebBackground,
            cosmicWeb,
            universe,
            universeBackground,
//            startNode //
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
            $0.background.contents = UIColor(0x1F2831)
            $0.rootNode.addChildNodes(objects)
        }
    }
    
    func addAction() {
        
    }
}

// MARK: - Coordinator
extension ScaleModeSceneView {
    class Coordinator: NSObject {
        let parent: ScaleModeSceneViewProtocol
        let gestureHandler: GestureHandler
        
        init(parent: ScaleModeSceneViewProtocol) {
            self.parent = parent
            self.gestureHandler = GestureHandler(parent: parent)
        }
    }
}

extension ScaleModeSceneView.Coordinator: SCNSceneRendererDelegate {
}
