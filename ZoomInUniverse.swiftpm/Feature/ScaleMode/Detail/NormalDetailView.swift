import SwiftUI
import SceneKit

enum NodeType {
    case earth
    case airplain
    case human
    case galaxy
    case blackHole
    case artificialSatellites
    case aurora
    case molecule
    case starCluster
    case solarSystem
    case galaxyCluster
    
    var description: String {
        switch self {
        case .earth:
            """
            Earth is the third planet from the Sun and the only known celestial body that supports life. It has a diameter of about 12,742 kilometers (7,918 miles) and is composed of a solid inner core, a liquid outer core, a mantle, and a crust. Approximately 71% of its surface is covered by water, primarily in the form of oceans, while the remaining 29% consists of continents and islands.
            
            Earth's atmosphere is composed mainly of nitrogen (78%) and oxygen (21%), along with trace amounts of other gases. This atmosphere protects life by absorbing harmful solar radiation and maintaining a stable climate. The planet's climate varies widely due to geographical features and ocean currents, creating diverse ecosystems that support millions of species.
            
            Earth orbits the Sun once every 365.25 days, leading to the cycle of seasons. Its axial tilt of 23.5 degrees causes variations in temperature and daylight throughout the year. The Moon, Earth's only natural satellite, influences tides and stabilizes the planet’s rotation.
            
            Human civilization has significantly impacted Earth's environment through industrialization, deforestation, and pollution. Climate change, driven by greenhouse gas emissions, poses a major challenge for the future of the planet. However, efforts such as renewable energy, conservation, and international cooperation aim to protect Earth’s delicate balance and ensure sustainability for future generations.
            """
        case .airplain:
            """
            An airplane, also known as an aircraft or aeroplane, is a powered flying vehicle designed for air travel. It consists of a fuselage, wings, engines, landing gear, and a tail section. Airplanes use aerodynamic principles to generate lift, allowing them to overcome gravity and stay in the air.

            The wings of an airplane create lift as air flows over and under them, following Bernoulli’s principle. Jet engines or propellers provide thrust, propelling the aircraft forward. The tail and control surfaces, including the rudder, elevators, and ailerons, help pilots steer and stabilize the plane.

            Airplanes are used for various purposes, including passenger and cargo transport, military operations, scientific research, and emergency services. The aviation industry has revolutionized global travel, reducing long-distance journeys from days to hours.

            Modern airplanes are equipped with advanced avionics, autopilot systems, and fuel-efficient engines. However, aviation also impacts the environment through carbon emissions, leading to research into sustainable fuels and electric aircraft.
            """
        case .human:
            """
            Humans (Homo sapiens) are intelligent, social beings that belong to the primate family. They are characterized by their upright posture, advanced cognitive abilities, and capacity for language, culture, and technology. Humans have highly developed brains, which enable reasoning, problem-solving, and creativity.

            Human societies are diverse, consisting of different cultures, traditions, and belief systems. Language is a key aspect of human communication, allowing for the exchange of ideas and knowledge. Throughout history, humans have developed civilizations, built cities, and created various forms of art, science, and philosophy.

            Biologically, humans are mammals with complex emotions and social structures. They reproduce sexually and have an average lifespan of about 70-80 years, though this varies by factors such as genetics, environment, and medical advancements.

            Humans have greatly influenced Earth’s environment, shaping landscapes, developing technology, and altering ecosystems. While innovation has led to progress, challenges such as climate change, resource depletion, and ethical dilemmas continue to shape the future of humanity.
            """
        case .galaxy:
            """
            A galaxy is a vast system of stars, planets, gas, dust, and dark matter, all held together by gravity. Galaxies come in different shapes and sizes, with the three main types being spiral galaxies, elliptical galaxies, and irregular galaxies. The Milky Way, our home galaxy, is a spiral galaxy containing billions of stars, including our Sun.

            Galaxies can range from small dwarf galaxies with just a few million stars to massive galaxies containing trillions of stars. At the center of most large galaxies lies a supermassive black hole, which influences the movement of surrounding stars and gas. Galaxies can form clusters and superclusters, which are the largest structures in the universe.

            Galaxies evolve over billions of years through interactions such as mergers and collisions. Studying galaxies helps scientists understand the universe’s history, structure, and ultimate fate. The James Webb Space Telescope and other observatories continue to reveal new insights about these cosmic structures.
            """
        case .blackHole:
            """
            A black hole is a region of space where gravity is so strong that nothing, not even light, can escape from it. Black holes form when massive stars collapse under their own gravity at the end of their life cycle. The boundary surrounding a black hole is called the event horizon, beyond which nothing can return.

            At the center of a black hole lies the singularity, a point of infinite density where space and time break down. Black holes are classified into different types based on their mass: stellar black holes (formed from collapsed stars), supermassive black holes (found at the centers of galaxies), and intermediate or primordial black holes (theorized to exist but not yet confirmed).

            Black holes can be detected through their gravitational effects on nearby objects and by observing X-ray emissions from material falling into them. The study of black holes is crucial for understanding general relativity, spacetime, and the fundamental laws of physics.
            """
        case .artificialSatellites:
            """
            An artificial satellite is a human-made object placed into orbit around a celestial body, such as Earth, for various purposes. These satellites are launched using rockets and remain in space due to the balance between gravity and their forward motion. The first artificial satellite, Sputnik 1, was launched by the Soviet Union in 1957, marking the beginning of the space age.

            Satellites serve many functions, including communication, navigation (GPS), weather monitoring, Earth observation, scientific research, and military surveillance. They orbit at different altitudes, such as low Earth orbit (LEO), medium Earth orbit (MEO), and geostationary orbit (GEO), depending on their purpose.

            Satellites are equipped with solar panels for power, antennas for communication, and instruments for data collection. As technology advances, satellites continue to improve global connectivity, disaster prediction, and space exploration. However, the growing issue of space debris poses challenges for future satellite operations.
            """
        case .aurora:
            """
            An aurora, also known as the Northern Lights (Aurora Borealis) or Southern Lights (Aurora Australis), is a natural light display in the sky, primarily seen in high-latitude regions near the Arctic and Antarctic. Auroras are caused by charged particles from the Sun’s solar wind colliding with gases in Earth’s atmosphere, exciting them and creating colorful glowing lights.

            These charged particles are guided by Earth's magnetic field toward the poles, where they interact with oxygen and nitrogen, producing green, red, blue, and purple hues. The most common color is green, which results from oxygen atoms at about 100 km (60 miles) altitude. Red and purple appear at higher altitudes, while nitrogen creates blue and purple tones.

            Auroras are best observed in dark, clear skies away from city lights. They are not only a breathtaking phenomenon but also an important subject in space weather research, as strong solar storms can disrupt satellites and communication systems.
            """
        case .molecule:
            """
            A molecule is a group of two or more atoms bonded together, representing the smallest unit of a chemical compound that retains its properties. Molecules can be composed of the same element, like O₂ (oxygen gas), or different elements, like H₂O (water). They are held together by chemical bonds, mainly covalent bonds, which involve the sharing of electrons.

            Molecules vary in size and complexity. Simple molecules, like carbon dioxide (CO₂), have only a few atoms, while complex molecules, such as proteins or DNA, consist of thousands of atoms arranged in intricate structures. The study of molecules is essential in chemistry, biology, and materials science, as they determine the behavior of substances in different conditions.

            Molecular interactions play a crucial role in life processes, from respiration to DNA replication. Advances in nanotechnology and medicine continue to explore molecular structures for new treatments and innovations.
            """
        case .starCluster:
            """
            A star cluster is a group of stars that are gravitationally bound and formed from the same molecular cloud. Star clusters are classified into two main types: open clusters and globular clusters.

            Open clusters are relatively young, containing a few hundred to a few thousand stars. These clusters are often found in the disk of galaxies, like the Pleiades cluster in the Milky Way. Open clusters are less densely packed and tend to disperse over time as the stars drift apart.

            Globular clusters, on the other hand, are much older and contain tens of thousands to millions of stars. They are spherical in shape and tightly bound by gravity, with stars packed closely together. These clusters are typically found in the halos of galaxies, and they often contain some of the oldest stars in the universe.

            Star clusters are important for studying stellar evolution, as the stars within a cluster form around the same time and have similar ages and chemical compositions. Their study helps astronomers understand how stars are born, live, and die over time.
            """
        case .solarSystem:
            """
            The solar system is a collection of celestial bodies, including the Sun, eight planets, their moons, dwarf planets, asteroids, comets, and other objects, all bound together by gravity. The Sun, a star at the center of the solar system, provides light and heat that sustain life on Earth.

            The planets orbit the Sun in elliptical paths, with Mercury, Venus, Earth, and Mars being the terrestrial planets closest to the Sun, and Jupiter, Saturn, Uranus, and Neptune being the gas giants farther out. The asteroid belt, located between Mars and Jupiter, is filled with rocky debris, and beyond Neptune lies the Kuiper Belt, home to icy bodies and dwarf planets like Pluto.

            Comets, made of ice and dust, have elliptical orbits that bring them near the Sun, where they develop bright tails. The solar system’s vast space is filled with other small objects, such as meteoroids, which can become meteors if they enter Earth’s atmosphere.

            The study of the solar system provides insights into the formation and evolution of our own planet and the potential for life elsewhere in the universe.
            """
        case .galaxyCluster:
            """
            A galaxy cluster is a massive structure that consists of hundreds to thousands of galaxies bound together by gravity. It is one of the largest structures in the universe, containing not only galaxies but also hot intergalactic gas and large amounts of dark matter.

            Galaxy clusters are formed over billions of years through the merging of smaller galaxy groups. The largest known galaxy clusters can span millions of light-years across and have masses equivalent to quadrillions of Suns. They often contain elliptical and spiral galaxies, with the largest and brightest galaxy usually at the center.

            The hot gas in galaxy clusters emits strong X-rays, which astronomers study to understand their composition and behavior. The presence of dark matter is detected through gravitational lensing, where light from distant objects is bent by the cluster’s gravity. Studying galaxy clusters helps scientists explore cosmic evolution, large-scale structures, and the distribution of dark matter in the universe.
            """
        }
    }
}

struct NormalDetailView: View {
    @State private var isSheetPresented = true
    @State private var presentationDetent = PresentationDetent.height(100)
    
    let node: SCNNode
    let type: NodeType
    init(
        node: SCNNode,
        type: NodeType
    ) {
        self.node = node.clone()
        self.type = type
    }
    
    var body: some View {
        ScaleModeDetailView(
            node: node
        ) {
            self.isSheetPresented = false
        }
        .sheet(isPresented: $isSheetPresented) {
            ScrollView {
                LazyVStack {
                    if let name = node.name {
                        Text(name)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Text(type.description)
                }
                .padding(16)
            }
            .presentationDetents([.height(100), .medium, .large, ], selection: $presentationDetent)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
            .interactiveDismissDisabled()
        }
    }
}
