import Foundation
import SceneKit

enum Models {
    case galaxy
    case blackHole
    case artificialSatellites
    case male
    case atom
    case aurora
    case airplain
    case molecule
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
    case dna
    case computer
    case lightBulb
    case phone
    
    var node: SCNNode {
        let node = switch self {
        case .galaxy: Self.loadModel(name: "Galaxy")
        case .blackHole: Self.loadModel(name: "BlackHole")
        case .artificialSatellites: Self.loadModel(name: "ArtificialSatellites")
        case .male: Self.loadModel(name: "Male")
        case .atom: Self.loadModel(name: "Atom")
        case .aurora: Self.loadModel(name: "Aurora")
        case .airplain: Self.loadModel(name: "Airplain")
        case .molecule: Self.loadModel(name: "Molecule")
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
        case .sun: PlanetCreator.makePlanet(radius: 15.4, image: .sun)
        case .mercury: PlanetCreator.makePlanet(radius: 2.4397, image: .mercury)
        case .venus: PlanetCreator.makePlanet(radius: 6.0518, image: .venus)
        case .earth: PlanetCreator.makePlanet(radius: 6.371, image: .earth)
        case .moon: PlanetCreator.makePlanet(radius: 1.7374, image: .moon)
        case .mars: PlanetCreator.makePlanet(radius: 3.3895, image: .mars)
        case .jupiter: PlanetCreator.makePlanet(radius: 6.911, image: .jupiter)
        case .saturn: PlanetCreator.makePlanet(radius: 5.232, image: .saturn)
        case .uranus: PlanetCreator.makePlanet(radius: 6.911, image: .uranus)
        case .neptune: PlanetCreator.makePlanet(radius: 2.4622, image: .neptune)
        case .dna: Self.loadModel(name: "DNA")
        case .computer: Self.loadModel(name: "Computer")
        case .lightBulb: Self.loadModel(name: "LightBulb")
        case .phone: Self.loadModel(name: "Phone")
        }
        return node.clone()
    }
    
    private static func loadModel(name: String, withExtension: String = "usdz") -> SCNNode {
        guard let url = Bundle.main.url(forResource: name, withExtension: withExtension),
              let scene = try? SCNScene(url: url, options: nil) else {
            fatalError("Load model failure - name: \(name)")
        }
        return scene.rootNode
    }
}
