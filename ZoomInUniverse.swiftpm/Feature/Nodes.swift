import Foundation
import SceneKit

enum Nodes {
    case galaxy
    case blackHole
    case artificialSatellites
    case male
    case atom
    case aurora
    case molecule
    case starCluster
    case solarSystem
    case sun
    case mercury
    case venus
    case earth
    case moon
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    
    var node: SCNNode {
        let node = switch self {
        case .galaxy: Self.loadModel(name: "Galaxy")
        case .blackHole: Self.loadModel(name: "BlackHole")
        case .artificialSatellites: Self.loadModel(name: "ArtificialSatellites")
        case .male: Self.loadModel(name: "Male")
        case .atom: Self.loadModel(name: "Atom")
        case .aurora: Self.loadModel(name: "Aurora")
        case .molecule: Self.loadModel(name: "Molecule")
        case .starCluster: SCNNode().apply { node in
            node.addBloomEffect(intensity: 1)
            node.addChildNodes(
                Array(repeating: 0, count: 60).map { _ in
                    StarNodeFactory.makeStarNode().apply {
                        let (x, y, z) = randomPointOnEllipsoid(a: 1, b: 4, c: 9)
                        $0.position = SCNVector3(x, y, z)
                    }
                }
            )
        }
        case .solarSystem: SCNNode().apply {
            $0.name = "Solar System"
            $0.addChildNodes(
                Self.sun.node,
                PlanetCreator.makePlanetOrbit(orbitalDay: 88, radius: 40).apply {
                    $0.addChildNode(
                        Self.mercury.node
                            .set(\.position, SCNVector3(40, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 225, radius: 60).apply {
                    $0.addChildNode(
                        Self.venus.node
                            .set(\.position, SCNVector3(60, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 365, radius: 80).apply {
                    $0.addChildNode(
                        Self.earth.node
                            .set(\.position, SCNVector3(80, 0, 0))
                            .apply {
                                $0.addChildNode(
                                    PlanetCreator.makePlanetOrbit(orbitalDay: 27, radius: 10).apply {
                                        $0.addChildNode(
                                            Self.moon.node
                                                .set(\.position, SCNVector3(10, 0, 0))
                                        )
                                    }
                                )
                            }
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 687, radius: 100).apply {
                    $0.addChildNode(
                        Self.mars.node
                            .set(\.position, SCNVector3(100, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 3950, radius: 120).apply {
                    $0.addChildNode(
                        Self.jupiter.node
                            .set(\.position, SCNVector3(120, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 10731, radius: 140).apply {
                    $0.addChildNode(
                        Self.saturn.node
                            .set(\.position, SCNVector3(140, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 30660, radius: 160).apply {
                    $0.addChildNode(
                        Self.uranus.node
                            .set(\.position, SCNVector3(160, 0, 0))
                    )
                },
                PlanetCreator.makePlanetOrbit(orbitalDay: 60223, radius: 180).apply {
                    $0.addChildNode(
                        Self.neptune.node
                            .set(\.position, SCNVector3(180, 0, 0))
                    )
                }
            )
        }
        case .sun: PlanetCreator.makePlanet(name: "Sun", radius: 15.4, image: .sun)
        case .mercury: PlanetCreator.makePlanet(name: "Mercury", radius: 2.4397, image: .mercury)
        case .venus: PlanetCreator.makePlanet(name: "Venus", radius: 6.0518, image: .venus)
        case .earth: PlanetCreator.makePlanet(name: "Earth", radius: 6.371, image: .earth)
        case .moon: PlanetCreator.makePlanet(name: "Moon", radius: 1.7374, image: .moon)
        case .mars: PlanetCreator.makePlanet(name: "Mars", radius: 3.3895, image: .mars)
        case .jupiter: PlanetCreator.makePlanet(name: "Jupiter", radius: 6.911, image: .jupiter)
        case .saturn: PlanetCreator.makePlanet(name: "Saturn", radius: 5.232, image: .saturn)
        case .uranus: PlanetCreator.makePlanet(name: "Uranus", radius: 6.911, image: .uranus)
        case .neptune: PlanetCreator.makePlanet(name: "Neptune", radius: 2.4622, image: .neptune)
        }
        return node.clone()
    }
    
    static func loadModel(name: String) -> SCNNode {
        guard let url = Bundle.main.url(forResource: name, withExtension: "usdz"),
              let scene = try? SCNScene(url: url, options: nil) else {
            fatalError("Load model failure - name: \(name)")
        }
        return scene.rootNode.apply {
            $0.name = name
        }
    }
}
