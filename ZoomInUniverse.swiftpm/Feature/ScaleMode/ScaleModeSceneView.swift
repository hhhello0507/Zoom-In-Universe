import SwiftUI
import SceneKit

private func createElectron(
    zPos: Float,
    action: SCNAction
) -> SCNNode {
    SCNNode().apply {
        $0.eulerAngles = .randomRotation()
        $0.addChildNodes(
            SCNNode().apply {
                $0.addChildNode(
                    SCNNode().apply {
                        $0.geometry = SCNSphere(radius: 0.5).apply {
                            $0.firstMaterial?.diffuse.contents = UIColor.gray
                        }
                        $0.position.z += zPos
                    }
                )
                $0.runAction(
                    SCNAction.repeatForever(action)
                )
            },
            SCNNode().apply {
                $0.geometry = SCNTube(innerRadius: CGFloat(zPos) - 0.1, outerRadius: CGFloat(zPos), height: 0.1).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.gray.withAlphaComponent(0.3)
                }
            }
        )
    }
}

private func createNucleon(color: UIColor) -> SCNNode {
    SCNNode().apply {
        $0.geometry = SCNSphere(radius: 1).apply {
            $0.firstMaterial?.diffuse.contents = color
        }
        $0.position.z += 0.4
    }
}

struct ScaleModeSceneView: UIViewRepresentable, ScaleModeSceneViewProtocol {
    static let cameraOffsetPosZ: Float = 25
    static var cameraStartPosZ: Float?
    
    // MARK: Parameter
    let scnView: SCNView
//    @Binding var cameraPosZ: Float
    @Binding var selectedNode: SCNNode?
    
    // MARK: Property
    let scene = SCNScene()
    let camera = SCNNode()
        .set(\.camera, SCNCamera()
            .set(\.zFar, 10000)
            .set(\.zNear, 0.01))
    
    // nodes
    let quark = SCNNode().apply {
        $0.setAllName("Quark")
        $0.addTitle()
    }
    let neutrons = CustomNode().apply {
        $0.addChildNodes(
            createNucleon(color: .red).apply {
                $0.position.z += 0.4
            },
            createNucleon(color: .red).apply {
                $0.position.x += 1.5
                $0.position.y += 0.8
            },
            createNucleon(color: .red).apply {
                $0.position.y -= 1.8
            },
            createNucleon(color: .red).apply {
                $0.position.x -= 1.5
                $0.position.y += 0.8
            },
            // indicator
            SCNNode().apply {
                $0.geometry = SCNTube(innerRadius: 0, outerRadius: 0.1, height: 5).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.red
                }
                $0.eulerAngles = SCNVector3(0, 0, .angle(65))
                $0.position.x += 2.5
                $0.position.y -= 3
            }
        )
        $0.setAllName("Neutron")
        $0.addTitle().let {
            $0.position.y -= 10
            $0.position.x += 10
        }
    }
    let protons = CustomNode().apply {
        $0.addChildNodes(
            createNucleon(color: .blue).apply {
                $0.position.y += 1.4
            },
            createNucleon(color: .blue).apply {
                $0.position.y -= 1
                $0.position.x += 1.4
            },
            createNucleon(color: .blue).apply {
                $0.position.y -= 1
                $0.position.x -= 1.4
            },
            // indicator
            SCNNode().apply {
                $0.geometry = SCNTube(innerRadius: 0, outerRadius: 0.1, height: 5).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.blue
                }
                $0.eulerAngles = SCNVector3(0, 0, .angle(-65))
                $0.position.x -= 4
                $0.position.y -= 2.5
            }
        )
        $0.name = "Proton"
        $0.addTitle().let {
            $0.position.y -= 10
            $0.position.x -= 10
        }
    }
    let electrons = CustomNode().apply {
        $0.addChildNodes(
            createElectron(
                zPos: 20,
                action: .rotateBy(
                    x: 0,
                    y: 2 * .pi,
                    z: 0,
                    duration: 1
                )
            ),
            createElectron(
                zPos: 20,
                action: SCNAction.rotateBy(
                    x: 0,
                    y: 2 * .pi,
                    z: 0,
                    duration: 1
                )
            ),
            createElectron(
                zPos: 20,
                action: SCNAction.rotateBy(
                    x: 0,
                    y: 2 * .pi,
                    z: 0,
                    duration: 1
                )
            )
        )
        $0.setAllName("Electrons")
        $0.addTitle()
    }
    let molecule = CustomNode().apply {
        $0.addChildNode(
            Nodes.molecule.node.apply {
                $0.scale = SCNVector3(0.1, 0.1, 0.1)
            }
        )
        $0.setAllName("Molecule")
        $0.addTitle()
    }
    let earthWrapperNode = SCNNode()
    let moonNode = Nodes.moon.node.apply {
        $0.position = .init(10, 8, 0)
        $0.addTitle()
    }
    let human = SCNNode().apply {
        $0.addChildNode(
            Nodes.male.node.apply {
                $0.scale = SCNVector3(0.1, 0.1, 0.1)
                $0.position.y -= 10
            }
        )
//        func a(node: SCNNode) -> Int {
//            return node.childNodes.count + node.childNodes.map {
//                a(node: $0)
//            }.reduce(0, +)
//        }
//        print("WOW")
//        print(a(node: $0))
        $0.setAllName("Human")
        $0.addTitle().let {
            $0.position.y += 5
        }
    }
    let pyramid = CustomNode().apply {
        $0.geometry = SCNPyramid(width: 30, height: 15, length: 30).apply {
            $0.materials.forEach {
                $0.diffuse.contents = UIImage(named: "PyramidTexture")
            }
        }
        $0.setAllName("Pyramid")
        $0.addTitle()
        $0.eulerAngles = SCNVector3(
            .angle(30),
            .angle(30),
            .angle(30)
        )
        $0.position.y -= 15
    }
    let ocean = CustomNode.of(
        EarthCreator.createGround(materialContents: UIImage(named: "OceanTexture")).apply {
            $0.position = SCNVector3(0, -3, 0)
            $0.eulerAngles = SCNVector3(.angle(15), 0, 0)
            $0.setAllName("Ocean")
            $0.addTitle()
        }
    )
    let earthNode = CustomNode.of(
        Nodes.earth.node.apply {
            $0.position.y -= 7
            $0.addTitle()
        }
    )
    let clouds = CustomNode.of(
        EarthCreator.createCloud().apply {
            $0.addChildNode(
                CustomNode().apply {
                    $0.geometry = SCNSphere(radius: 5).apply {
                        $0.firstMaterial?.diffuse.contents = UIColor.clear
                    }
                }
            )
            $0.setAllName("Cloud")
            $0.addTitle()
        }
    )
    let troposphere = CustomNode().apply {
        $0.name = "Troposphere"
        $0.addTitle()
    }
    let airplain = CustomNode().apply {
        $0.addChildNode(
            Nodes.airplain.node.apply {
                $0.scale = .init(0.01, 0.01, 0.01)
                $0.eulerAngles = .init(0, .angle(60), .angle(-30))
            }
        )
        $0.setAllName("Airplain")
        $0.addTitle()
    }
    let stratosphere = CustomNode().apply {
        $0.setAllName("Stratosphere")
        $0.addTitle()
    }
    let mesosphere = CustomNode().apply {
        $0.setAllName("Mesosphere")
        $0.addTitle()
    }
    let aurora = CustomNode().apply {
        $0.addChildNode(
            Nodes.aurora.node.apply {
                $0.scale = .init(0.01, 0.01, 0.01)
            }
        )
        $0.setAllName("Aurora")
        $0.addTitle()
    }
    let artificialSatellite = CustomNode().apply {
        $0.addChildNode(
            Nodes.artificialSatellites.node.apply {
                $0.scale = SCNVector3(0.02, 0.02, 0.02)
                $0.position = SCNVector3(2, -4.5, 0)
                $0.eulerAngles = SCNVector3(
                    .angle(30),
                    .angle(-90),
                    0
                )
            }
        )
        $0.setAllName("Artificial Satellites")
        $0.addTitle()
    }
    let thermosphere = CustomNode().apply {
        $0.setAllName("Thermosphere")
        $0.addTitle()
    }
    let spaceBackground = GlobalCreator.createBackground(radiusOffset: 4, contents: Images.space.uiImage)
    let solarSystem = CustomNode.of(
        Nodes.solarSystem.node.apply {
            $0.scale = SCNVector3(0.1, 0.1, 0.1)
            $0.eulerAngles = SCNVector3(
                .angle(30),
                0,
                .angle(30)
            )
            $0.position = SCNVector3(4, 0, 0)
            $0.addTitle().let {
                $0.scale = SCNVector3(1, 1, 1)
                $0.position.y += 8
            }
        }
    )
    let starCluster = CustomNode.of(
        Nodes.starCluster.node.apply {
            $0.setAllName("Star Cluster")
            $0.addTitle()
        }
    )
    let blackHole = CustomNode().apply {
        $0.eulerAngles = SCNVector3(.angle(10), 0, .angle(10))
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
        $0.setAllName("Black Hole")
        $0.addTitle()
    }
    let galaxy = CustomNode().apply {
        $0.eulerAngles = SCNVector3(.angle(-64), .angle(30), 0)
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
        $0.setAllName("Galaxy")
        $0.addTitle()
    }
    let galaxyCluster = CustomNode().apply {
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
        $0.setAllName("Galaxy Cluster")
        $0.addTitle()
    }
    let cosmicWebBackground = GlobalCreator.createBackground(radiusOffset: 5, contents: Images.cosmicWeb.uiImage, size: 1200)
    let cosmicWeb = CustomNode().apply {
        $0.setAllName("Cosmic Web")
        $0.addTitle()
    }
//    let universeBackground = GlobalCreator.createBackground(radiusOffset: 6, contents: UIColor.white)
    let universe = CustomNode().apply {
        $0.setAllName("Universe")
        $0.addTitle()
    }
    let startNode = SCNNode()
    
    // MARK: Initializer
    init(
        scnView: SCNView,
//        cameraPosZ: Binding<Float>,
        selectedNode: Binding<SCNNode?>
    ) {
        self.scnView = scnView
//        self._cameraPosZ = cameraPosZ
        self._selectedNode = selectedNode
        
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
        guard cameraPosZ <= 2000 else { return }
        self.camera.position.z = cameraPosZ
//        self.cameraPosZ = cameraPosZ
        
        self.scene.background.contents = switch self.camera.position.z {
        case ..<self.human.position.z:
            UIColor.black
        case  ..<self.stratosphere.position.z:
            UIColor(0xB0E5FF)
        case ..<self.mesosphere.position.z:
            UIColor(0x3D5466)
        default:
            UIColor(0x1F2831)
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
                    protons,
                    electrons
                )
                $0.setAllName("Atom")
                $0.addTitle().let {
                    $0.position.y += 10
                }
            },
//            startNode,
            molecule,
//            startNode,
            human,
            startNode,
            pyramid,
            ocean,
//            startNode, //
            earthNode,
            clouds,
            troposphere,
            airplain,
//            startNode,
            spaceBackground,
            stratosphere,
            mesosphere,
            aurora,
            artificialSatellite,
            thermosphere,
//            startNode, //
            solarSystem,
            starCluster,
            blackHole,
            cosmicWebBackground,
            galaxy,
            galaxyCluster,
            cosmicWeb,
            SCNNode(),
            SCNNode(),
            universe
//            startNode //
        ]
        
        objects.enumerated().forEach { index, object in
            object.let {
                $0.position.z += Float(index) * 70
            }
        }
        
        Self.cameraStartPosZ = startNode.position.z + Self.cameraOffsetPosZ
        camera.position.z = Self.cameraStartPosZ!
//        DispatchQueue.main.async {
//            cameraPosZ = camera.position.z
//        }
        
        scene.let {
            self.scene.background.contents = UIColor(0x1F2831)
            $0.rootNode.addChildNodes(objects)
        }
    }
    
    func addAction() {
        [
            self.earthNode,
            self.airplain,
            self.galaxy,
            self.blackHole,
            self.artificialSatellite,
            self.aurora,
            self.molecule,
            self.starCluster,
            self.solarSystem,
            self.galaxyCluster,
            self.clouds,
            self.ocean,
            self.pyramid
        ].forEach { node in
            node.addAction {
                self.selectedNode = node
            }
        }
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
