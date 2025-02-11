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
    case pyramid
    case cloud
    case ocean
    case quark
    case cell
    case electron
    case dna
    
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
        case .pyramid:
            """
            A pyramid is a large, triangular-shaped structure with a broad base that narrows to a point at the top. Pyramids have been built by various civilizations throughout history, primarily as tombs, religious monuments, or ceremonial sites. The most famous pyramids are the Egyptian pyramids, including the Great Pyramid of Giza, which was built around 2600 BCE as a tomb for Pharaoh Khufu.

            Egyptian pyramids were constructed using massive limestone and granite blocks, showcasing advanced engineering skills. Inside, they contained burial chambers, intricate passageways, and treasures for the afterlife.

            Other civilizations, such as the Maya, Aztecs, and Mesopotamians, also built pyramids, but theirs were often stepped rather than smooth-sided. The Mayan pyramids, like those in Chichén Itzá, served as temples for religious ceremonies.

            Pyramids remain architectural wonders, reflecting the ingenuity, culture, and beliefs of ancient civilizations.
            """
        case .cloud:
            """
            A cloud is a visible mass of tiny water droplets or ice crystals suspended in the Earth's atmosphere. Clouds form when warm, moist air rises, cools, and condenses around dust or other particles in the air. They play a crucial role in weather, climate, and the water cycle.

            There are several types of clouds, classified by their altitude and shape. Cirrus clouds are thin and wispy, found at high altitudes. Cumulus clouds are fluffy and often indicate fair weather, while stratus clouds form low, gray layers that bring overcast skies or drizzle. Cumulonimbus clouds are tall, dense clouds that produce thunderstorms.

            Clouds reflect sunlight, helping to regulate Earth's temperature, and they release precipitation in the form of rain, snow, sleet, or hail. Scientists also study clouds on other planets, like Jupiter’s stormy atmosphere, to better understand weather patterns beyond Earth.
            """
        case .ocean:
            """
            The ocean is a vast body of saltwater covering about 71% of Earth's surface and containing 97% of the planet's water. It is divided into five major oceans: the Pacific, Atlantic, Indian, Southern, and Arctic Oceans. The Pacific Ocean is the largest and deepest, while the Arctic Ocean is the smallest and shallowest.

            Oceans play a vital role in climate regulation, absorbing heat and distributing it through currents like the Gulf Stream. They also produce over 50% of Earth's oxygen through marine plants such as phytoplankton.

            The ocean is home to millions of species, from tiny microorganisms to massive blue whales. The deep sea remains largely unexplored, with mysterious creatures living in the Mariana Trench, the deepest known part of the ocean.

            However, human activities like pollution, overfishing, and climate change threaten ocean ecosystems. Conservation efforts focus on protecting marine life and maintaining ocean health for future generations.
            """
        case .quark:
            """
            A quark is a fundamental particle and one of the building blocks of matter in the Standard Model of particle physics. Quarks combine to form protons and neutrons, which are the components of atomic nuclei. There are six types, or "flavors," of quarks: up, down, charm, strange, top, and bottom.

            Each quark has a property called "color charge," which is related to the strong force that holds quarks together inside protons, neutrons, and other hadrons. Quarks are never found in isolation due to a phenomenon known as "confinement"; instead, they always exist in combinations that form composite particles like protons and neutrons.

            Quarks also have other properties, such as mass, electric charge, and spin. For instance, up quarks have a charge of +2/3, while down quarks have a charge of -1/3. Understanding quarks and their interactions is key to understanding the fundamental forces of the universe.
            """
        case .cell:
            """
            A cell is the basic unit of life and serves as the fundamental building block of all living organisms. It is the smallest structural and functional unit capable of carrying out essential life processes such as metabolism, growth, reproduction, and response to stimuli. There are two main types of cells: prokaryotic and eukaryotic.

            Prokaryotic cells are simpler and smaller. They do not have a defined nucleus or membrane-bound organelles. Organisms like bacteria and archaea are made up of prokaryotic cells. On the other hand, eukaryotic cells are more complex and contain a defined nucleus that stores the cell’s genetic material (DNA). These cells also have membrane-bound organelles, such as mitochondria and the endoplasmic reticulum, which perform specialized functions. Eukaryotic cells are found in organisms such as animals, plants, fungi, and protists.

            A typical eukaryotic cell is composed of several key components. The cell membrane is a semi-permeable barrier that controls the movement of substances into and out of the cell. The nucleus serves as the control center of the cell, directing cellular activities and housing DNA. The cytoplasm is the jelly-like substance inside the cell where metabolic processes occur. Organelles within the cell, like ribosomes and mitochondria, are responsible for carrying out specific tasks such as protein synthesis and energy production.

            Cells work together to form tissues, which combine to create organs, and ultimately, entire organisms. Each cell type plays a specific role, contributing to the overall function and survival of the organism.
            """
        case .electron:
            """
            An electron is a fundamental particle that carries a negative electric charge. It is one of the key building blocks of matter and is found outside the nucleus of an atom, moving around it in regions called electron clouds or orbitals. Electrons are part of a larger group of particles known as leptons, which are not affected by the strong nuclear force (the force that holds quarks together inside protons and neutrons).

            Electrons have very little mass compared to protons and neutrons, roughly 1/1836 of the mass of a proton. Despite their small mass, they play a crucial role in chemical bonding, electricity, and many other physical phenomena.

            The electron’s electric charge is essential to the creation of electric fields and currents, which are fundamental to the operation of electronic devices. Electrons also have a property called spin, which is a form of intrinsic angular momentum, and they obey the Pauli exclusion principle, which states that no two electrons can occupy the same quantum state at the same time in a given system.

            Electrons move in specific energy levels or shells around the nucleus, and they can absorb or emit energy by jumping between these levels, a process that is crucial for phenomena like light emission (as in neon signs or atomic spectra).
            """
        case .dna:
            """
            DNA (deoxyribonucleic acid) is the molecule that carries the genetic instructions for life. It is present in all living organisms and is responsible for storing and transmitting genetic information across generations. DNA plays a fundamental role in determining an organism’s traits, guiding the growth, development, and functioning of cells.

            Structurally, DNA consists of two long strands that form a double helix. Each strand is made up of smaller units called nucleotides, which consist of three components: a sugar molecule (deoxyribose), a phosphate group, and a nitrogenous base. There are four types of nitrogenous bases in DNA: adenine (A), thymine (T), cytosine (C), and guanine (G). These bases pair in a specific way—adenine with thymine (A-T) and cytosine with guanine (C-G)—through hydrogen bonds. This complementary base pairing ensures accurate replication of DNA and the proper transmission of genetic information.

            DNA is stored in the nucleus of eukaryotic cells, while in prokaryotic cells, it is found in the cytoplasm. Within the nucleus, DNA is organized into structures called chromosomes, which contain genes—specific sequences of DNA that encode proteins. Proteins, in turn, play a crucial role in carrying out cellular functions. The process of copying DNA before cell division is called replication, ensuring that each new cell receives an identical copy of genetic material.

            The expression of genetic information occurs through two main processes: transcription and translation. In transcription, DNA is used as a template to produce messenger RNA (mRNA), which carries genetic instructions to ribosomes. In translation, ribosomes read the mRNA sequence and assemble amino acids to form proteins. These proteins are essential for maintaining life, as they regulate cellular processes, build structures, and facilitate biochemical reactions.

            DNA plays a key role in evolution and heredity. Mutations, or changes in the DNA sequence, can lead to genetic variation, which drives natural selection and the evolution of species over time. Additionally, advancements in DNA research have led to breakthroughs in medicine, forensic science, and biotechnology. Techniques such as genetic engineering, gene therapy, and DNA fingerprinting have revolutionized fields like disease treatment, crime investigation, and agriculture.

            Overall, DNA is the blueprint of life, encoding the instructions that shape all living organisms and ensuring the continuity of genetic information from one generation to the next.
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
