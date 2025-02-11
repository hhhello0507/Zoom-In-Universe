import SwiftUI
import SceneKit

struct ScaleModeSceneView: UIViewRepresentable, ScaleModeSceneViewProtocol {
    static let cameraOffsetPosZ: Float = 25
    static var cameraStartPosZ: Float!
    
    // MARK: Parameter
    let scnView: SCNView
    @Binding var selectedNode: SCNNode?
    
    // MARK: Property
    let scene = SCNScene()
    let camera = SCNNode()
        .set(\.camera, SCNCamera()
            .set(\.zFar, 10000)
            .set(\.zNear, 0.01))
    
    // nodes
    let quark = SCNNode().apply {
        $0.geometry = SCNSphere(radius: 4).apply {
            $0.firstMaterial?.diffuse.contents = UIColor.yellow
        }
        $0.setAllName("Quark")
        $0.addTitle()
    }
    let neutrons = SCNNode().apply {
        $0.setAllName("Neutron")
        $0.addTitle().let {
            $0.position.y -= 10
            $0.position.x += 10
        }
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
    }
    let protons = SCNNode().apply {
        $0.setAllName("Proton")
        $0.addTitle().let {
            $0.position.y -= 10
            $0.position.x -= 10
        }
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
    }
    let electron = SCNNode().apply {
        $0.setAllName("Electron")
        $0.addTitle().let {
            $0.position.y = 10
        }
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
    }
    let molecule = SCNNode().apply {
        $0.addChildNode(
            Nodes.molecule.node.apply {
                $0.scale = SCNVector3(0.1, 0.1, 0.1)
                $0.runAction(.repeatRotationForever)
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
    let dna = SCNNode().apply {
        $0.addChildNode(
            Nodes.dna.node.apply {
                $0.scale = SCNVector3(0.04, 0.04, 0.04)
                $0.eulerAngles = SCNVector3(.angle(30), 0, .angle(30))
                $0.runAction(.repeatRotationForever)
            }
        )
        $0.setAllName("DNA")
        $0.addTitle(fontSize: 5)
    }
    let cell = SCNNode().apply {
        $0.geometry = SCNSphere(radius: 5).apply {
            $0.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.3)
        }
        $0.addChildNode(
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 3).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.purple
                }
            }
        )
        $0.setAllName("Cell")
        $0.addTitle(fontSize: 5)
    }
    let makeHuman = SCNNode().apply {
        $0.addChildNodes(
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.phone.node.apply {
                        $0.scale = SCNVector3(0.03, 0.03, 0.03)
                        $0.eulerAngles = SCNVector3(0, .angle(-60), .angle(-50))
                        $0.runAction(.repeatRotationForever)
                    }
                )
                $0.position.y += 10
                $0.setAllName("Phone")
                $0.addTitle(fontSize: 4)
            },
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.computer.node.apply {
                        $0.scale = SCNVector3(0.03, 0.03, 0.03)
                        $0.runAction(.repeatRotationForever)
                    }
                )
                $0.position.x += 10
                $0.position.y -= 5
                $0.setAllName("Computer")
                $0.addTitle(fontSize: 4)
            },
            SCNNode().apply {
                $0.addChildNode(
                    Nodes.lightBulb.node.apply {
                        $0.scale = SCNVector3(0.03, 0.03, 0.03)
                        $0.runAction(.repeatRotationForever)
                    }
                )
                $0.position.x -= 10
                $0.position.y -= 5
                $0.setAllName("Light Bulb")
                $0.addTitle(fontSize: 4)
            }
        )
    }
    let human = SCNNode().apply {
        $0.addChildNode(
            Nodes.male.node.apply {
                $0.scale = SCNVector3(0.1, 0.1, 0.1)
                $0.runAction(.repeatRotationForever)
            }
        )
        $0.position.y -= 7
        $0.setAllName("Human")
        $0.addTitle()
    }
    let pyramid = SCNNode().apply {
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
    let ocean = SCNNode().apply {
        $0.addChildNode(
            EarthCreator.createGround(materialContents: UIImage(named: "OceanTexture")).apply {
                $0.position = SCNVector3(0, -3, 0)
                $0.eulerAngles = SCNVector3(.angle(15), 0, 0)
            }
        )
        $0.setAllName("Ocean")
        $0.addTitle()
    }
    let earthNode = Nodes.earth.node.apply {
        $0.position.y -= 7
        $0.addTitle()
    }
    let clouds = EarthCreator.createCloud().apply {
        $0.addChildNode(
            // for touch
            SCNNode().apply {
                $0.geometry = SCNSphere(radius: 5).apply {
                    $0.firstMaterial?.diffuse.contents = UIColor.clear
                }
            }
        )
        $0.setAllName("Cloud")
        $0.addTitle()
    }
    let airplain = SCNNode().apply {
        $0.addChildNode(
            Nodes.airplain.node.apply {
                $0.scale = .init(0.01, 0.01, 0.01)
                $0.eulerAngles = .init(0, .angle(60), .angle(-30))
            }
        )
        $0.setAllName("Airplain")
        $0.addTitle()
    }
    let skyBackground = GlobalCreator.createBackground(radiusOffset: 3, contents: UIImage(named: "Sky"))
    let aurora = SCNNode().apply {
        $0.addChildNode(
            Nodes.aurora.node.apply {
                $0.scale = .init(0.01, 0.01, 0.01)
            }
        )
        $0.setAllName("Aurora")
        $0.addTitle()
    }
    let artificialSatellite = SCNNode().apply {
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
    let spaceBackground = GlobalCreator.createBackground(radiusOffset: 4, contents: Images.space.uiImage)
    let solarSystem = Nodes.solarSystem.node.apply {
        $0.scale = SCNVector3(0.1, 0.1, 0.1)
        $0.eulerAngles = SCNVector3(
            .angle(30),
            0,
            .angle(30)
        )
        $0.setAllName("Solar System")
        $0.position = SCNVector3(4, 0, 0)
        $0.addTitle().let {
            $0.scale = SCNVector3(1, 1, 1)
            $0.position.y += 8
        }
    }
    let starCluster = Nodes.starCluster.node.apply {
        $0.setAllName("Star Cluster")
        $0.addTitle()
    }
    let blackHole = SCNNode().apply {
        $0.eulerAngles = SCNVector3(.angle(10), 0, .angle(10))
        $0.addChildNode(
            Nodes.blackHole.node.apply {
                $0.scale = SCNVector3(0.03, 0.03, 0.03)
            }
        )
        $0.setAllName("Black Hole")
        $0.addTitle()
    }
    let galaxy = SCNNode().apply {
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
        $0.setAllName("Galaxy Cluster")
        $0.addTitle()
    }
    let cosmicWebBackground = GlobalCreator.createBackground(radiusOffset: 5, contents: Images.cosmicWeb.uiImage)
    let cosmicWeb = SCNNode().apply {
        $0.setAllName("Cosmic Web")
        $0.addTitle()
    }
    let universe = SCNNode().apply {
        $0.setAllName("Universe")
        $0.addTitle()
    }
    let __START_NODE__ = SCNNode()
    
    // MARK: Initializer
    init(
        scnView: SCNView,
        selectedNode: Binding<SCNNode?>
    ) {
        self.scnView = scnView
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
        guard 20 <= cameraPosZ && cameraPosZ <= 2000 else { return }
        self.camera.position.z = cameraPosZ
        
        self.scene.background.contents = switch self.camera.position.z {
        case ..<self.human.position.z:
            UIColor.black
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
                $0.addChildNodes(neutrons, protons, electron)
            },
            molecule,
            SCNNode().apply {
                $0.addChildNodes(
                    dna.apply {
                        $0.position.x -= 10
                    },
                    cell.apply {
                        $0.position.x += 10
                    }
                )
            },
            makeHuman,
            __START_NODE__,
            human,
            pyramid,
            ocean,
            earthNode,
            clouds,
            skyBackground,
            airplain,
            spaceBackground,
            SCNNode().apply {
                $0.addChildNodes(
                    aurora.apply {
                        $0.position.x -= 10
                    },
                    artificialSatellite.apply {
                        $0.position.x += 10
                    }
                )
            },
            solarSystem,
            //            starCluster,
            blackHole,
            cosmicWebBackground,
            galaxy,
            cosmicWeb,
            SCNNode(),
            SCNNode(),
            universe
        ]
        
        objects.enumerated().forEach { index, object in
            object.let {
                $0.position.z += Float(index) * 50
            }
        }
        
        scene.let {
            self.scene.background.contents = UIColor(0x1F2831)
            $0.rootNode.addChildNodes(objects)
        }
        
        Self.cameraStartPosZ = __START_NODE__.position.z + Self.cameraOffsetPosZ
        camera.position.z = Self.cameraStartPosZ
        self.updateCameraPosZ(Self.cameraStartPosZ)
    }
    
    func addAction() {
        [
            earthNode,
            airplain,
            galaxy,
            blackHole,
            artificialSatellite,
            aurora,
            molecule,
            starCluster,
            solarSystem,
            galaxyCluster,
            clouds,
            ocean,
            pyramid,
            quark,
            cell,
            electron,
            dna,
            makeHuman
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

extension SCNAction {
    static var repeatRotationForever: SCNAction {
        SCNAction.repeatForever(
            SCNAction.rotateBy(x: .angle(.random(in: -360..<360)), y: .angle(.random(in: -360..<360)), z: .angle(.random(in: -360..<360)), duration: 50)
        )
    }
}
