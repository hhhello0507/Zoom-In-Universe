//
//  NodeType.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/12/25.
//

import SwiftUI

enum NodeType: String {
    case earth = "Earth"
    case airplain = "Airplain"
    case human = "Human"
    case galaxy = "Galaxy"
    case blackHole = "Black Hole"
    case artificialSatellites = "Artificial Satellites"
    case aurora = "Aurora"
    case molecule = "Molecule"
    case solarSystem = "Solar System"
    case galaxyCluster = "Galaxy Cluster"
    case pyramid = "Pyramid"
    case cloud = "Cloud"
    case ocean = "Ocean"
    case quark = "Quark"
    case cell = "Cell"
    case electron = "Electron"
    case dna = "DNA"
    case mercury = "Mercury"
    case venus = "Venus"
    case moon = "Moon"
    case mars = "Mars"
    case jupiter = "Jupiter"
    case saturn = "Saturn"
    case uranus = "Uranus"
    case neptune = "Nepturn"
    case neutrons = "Neutrons"
    case protons = "Protons"
    case phone = "Phone"
    case computer = "Computer"
    case lightBulb = "Light bulb"
    
    var description: Text {
        switch self {
        case .earth:
            MarkdownText("""
Earth is the third planet from the Sun and the only known celestial body that supports life. It has a diameter of about 12,742 kilometers (7,918 miles) and is composed of a solid inner core, a liquid outer core, a mantle, and a crust. Approximately 71% of its surface is covered by water, primarily in the form of oceans, while the remaining 29% consists of continents and islands.

Earth's atmosphere is composed mainly of nitrogen (78%) and oxygen (21%), along with trace amounts of other gases. This atmosphere protects life by absorbing harmful solar radiation and maintaining a stable climate. The planet's climate varies widely due to geographical features and ocean currents, creating diverse ecosystems that support millions of species.

Earth orbits the Sun once every 365.25 days, leading to the cycle of seasons. Its axial tilt of 23.5 degrees causes variations in temperature and daylight throughout the year. The Moon, Earth's only natural satellite, influences tides and stabilizes the planet’s rotation.

Human civilization has significantly impacted Earth's environment through industrialization, deforestation, and pollution. Climate change, driven by greenhouse gas emissions, poses a major challenge for the future of the planet. However, efforts such as renewable energy, conservation, and international cooperation aim to protect Earth’s delicate balance and ensure sustainability for future generations.
""")
        case .airplain:
            MarkdownText("""
An airplane, also known as an aircraft or aeroplane, is a powered flying vehicle designed for air travel. It consists of a fuselage, wings, engines, landing gear, and a tail section. Airplanes use aerodynamic principles to generate lift, allowing them to overcome gravity and stay in the air.

The wings of an airplane create lift as air flows over and under them, following Bernoulli’s principle. Jet engines or propellers provide thrust, propelling the aircraft forward. The tail and control surfaces, including the rudder, elevators, and ailerons, help pilots steer and stabilize the plane.

Airplanes are used for various purposes, including passenger and cargo transport, military operations, scientific research, and emergency services. The aviation industry has revolutionized global travel, reducing long-distance journeys from days to hours.

Modern airplanes are equipped with advanced avionics, autopilot systems, and fuel-efficient engines. However, aviation also impacts the environment through carbon emissions, leading to research into sustainable fuels and electric aircraft.
""")
        case .human:
            MarkdownText("""
Humans (Homo sapiens) are intelligent, social beings that belong to the primate family. They are characterized by their upright posture, advanced cognitive abilities, and capacity for language, culture, and technology. Humans have highly developed brains, which enable reasoning, problem-solving, and creativity.

Human societies are diverse, consisting of different cultures, traditions, and belief systems. Language is a key aspect of human communication, allowing for the exchange of ideas and knowledge. Throughout history, humans have developed civilizations, built cities, and created various forms of art, science, and philosophy.

Biologically, humans are mammals with complex emotions and social structures. They reproduce sexually and have an average lifespan of about 70-80 years, though this varies by factors such as genetics, environment, and medical advancements.

Humans have greatly influenced Earth’s environment, shaping landscapes, developing technology, and altering ecosystems. While innovation has led to progress, challenges such as climate change, resource depletion, and ethical dilemmas continue to shape the future of humanity.
""")
        case .galaxy:
            MarkdownText("""
A galaxy is a vast system of stars, planets, gas, dust, and dark matter, all held together by gravity. Galaxies come in different shapes and sizes, with the three main types being spiral galaxies, elliptical galaxies, and irregular galaxies. The Milky Way, our home galaxy, is a spiral galaxy containing billions of stars, including our Sun.

Galaxies can range from small dwarf galaxies with just a few million stars to massive galaxies containing trillions of stars. At the center of most large galaxies lies a supermassive black hole, which influences the movement of surrounding stars and gas. Galaxies can form clusters and superclusters, which are the largest structures in the universe.

Galaxies evolve over billions of years through interactions such as mergers and collisions. Studying galaxies helps scientists understand the universe’s history, structure, and ultimate fate. The James Webb Space Telescope and other observatories continue to reveal new insights about these cosmic structures.
""")
        case .blackHole:
            MarkdownText("""
A black hole is a region of space where gravity is so strong that nothing, not even light, can escape from it. Black holes form when massive stars collapse under their own gravity at the end of their life cycle. The boundary surrounding a black hole is called the event horizon, beyond which nothing can return.

At the center of a black hole lies the singularity, a point of infinite density where space and time break down. Black holes are classified into different types based on their mass: stellar black holes (formed from collapsed stars), supermassive black holes (found at the centers of galaxies), and intermediate or primordial black holes (theorized to exist but not yet confirmed).

Black holes can be detected through their gravitational effects on nearby objects and by observing X-ray emissions from material falling into them. The study of black holes is crucial for understanding general relativity, spacetime, and the fundamental laws of physics.
""")
        case .artificialSatellites:
            MarkdownText("""
An artificial satellite is a human-made object placed into orbit around a celestial body, such as Earth, for various purposes. These satellites are launched using rockets and remain in space due to the balance between gravity and their forward motion. The first artificial satellite, Sputnik 1, was launched by the Soviet Union in 1957, marking the beginning of the space age.

Satellites serve many functions, including communication, navigation (GPS), weather monitoring, Earth observation, scientific research, and military surveillance. They orbit at different altitudes, such as low Earth orbit (LEO), medium Earth orbit (MEO), and geostationary orbit (GEO), depending on their purpose.

Satellites are equipped with solar panels for power, antennas for communication, and instruments for data collection. As technology advances, satellites continue to improve global connectivity, disaster prediction, and space exploration. However, the growing issue of space debris poses challenges for future satellite operations.
""")
        case .aurora:
            MarkdownText("""
An aurora, also known as the Northern Lights (Aurora Borealis) or Southern Lights (Aurora Australis), is a natural light display in the sky, primarily seen in high-latitude regions near the Arctic and Antarctic. Auroras are caused by charged particles from the Sun’s solar wind colliding with gases in Earth’s atmosphere, exciting them and creating colorful glowing lights.

These charged particles are guided by Earth's magnetic field toward the poles, where they interact with oxygen and nitrogen, producing green, red, blue, and purple hues. The most common color is green, which results from oxygen atoms at about 100 km (60 miles) altitude. Red and purple appear at higher altitudes, while nitrogen creates blue and purple tones.

Auroras are best observed in dark, clear skies away from city lights. They are not only a breathtaking phenomenon but also an important subject in space weather research, as strong solar storms can disrupt satellites and communication systems.
""")
        case .molecule:
            MarkdownText("""
A molecule is a group of two or more atoms bonded together, representing the smallest unit of a chemical compound that retains its properties. Molecules can be composed of the same element, like O₂ (oxygen gas), or different elements, like H₂O (water). They are held together by chemical bonds, mainly covalent bonds, which involve the sharing of electrons.

Molecules vary in size and complexity. Simple molecules, like carbon dioxide (CO₂), have only a few atoms, while complex molecules, such as proteins or DNA, consist of thousands of atoms arranged in intricate structures. The study of molecules is essential in chemistry, biology, and materials science, as they determine the behavior of substances in different conditions.

Molecular interactions play a crucial role in life processes, from respiration to DNA replication. Advances in nanotechnology and medicine continue to explore molecular structures for new treatments and innovations.
""")
        case .solarSystem:
            MarkdownText("""
The solar system is a collection of celestial bodies, including the Sun, eight planets, their moons, dwarf planets, asteroids, comets, and other objects, all bound together by gravity. The Sun, a star at the center of the solar system, provides light and heat that sustain life on Earth.

The planets orbit the Sun in elliptical paths, with Mercury, Venus, Earth, and Mars being the terrestrial planets closest to the Sun, and Jupiter, Saturn, Uranus, and Neptune being the gas giants farther out. The asteroid belt, located between Mars and Jupiter, is filled with rocky debris, and beyond Neptune lies the Kuiper Belt, home to icy bodies and dwarf planets like Pluto.

Comets, made of ice and dust, have elliptical orbits that bring them near the Sun, where they develop bright tails. The solar system’s vast space is filled with other small objects, such as meteoroids, which can become meteors if they enter Earth’s atmosphere.

The study of the solar system provides insights into the formation and evolution of our own planet and the potential for life elsewhere in the universe.
""")
        case .galaxyCluster:
            MarkdownText("""
A galaxy cluster is a massive structure that consists of hundreds to thousands of galaxies bound together by gravity. It is one of the largest structures in the universe, containing not only galaxies but also hot intergalactic gas and large amounts of dark matter.

Galaxy clusters are formed over billions of years through the merging of smaller galaxy groups. The largest known galaxy clusters can span millions of light-years across and have masses equivalent to quadrillions of Suns. They often contain elliptical and spiral galaxies, with the largest and brightest galaxy usually at the center.

The hot gas in galaxy clusters emits strong X-rays, which astronomers study to understand their composition and behavior. The presence of dark matter is detected through gravitational lensing, where light from distant objects is bent by the cluster’s gravity. Studying galaxy clusters helps scientists explore cosmic evolution, large-scale structures, and the distribution of dark matter in the universe.
""")
        case .pyramid:
            MarkdownText("""
A pyramid is a large, triangular-shaped structure with a broad base that narrows to a point at the top. Pyramids have been built by various civilizations throughout history, primarily as tombs, religious monuments, or ceremonial sites. The most famous pyramids are the Egyptian pyramids, including the Great Pyramid of Giza, which was built around 2600 BCE as a tomb for Pharaoh Khufu.

Egyptian pyramids were constructed using massive limestone and granite blocks, showcasing advanced engineering skills. Inside, they contained burial chambers, intricate passageways, and treasures for the afterlife.

Other civilizations, such as the Maya, Aztecs, and Mesopotamians, also built pyramids, but theirs were often stepped rather than smooth-sided. The Mayan pyramids, like those in Chichén Itzá, served as temples for religious ceremonies.

Pyramids remain architectural wonders, reflecting the ingenuity, culture, and beliefs of ancient civilizations.
""")
        case .cloud:
            MarkdownText("""
A cloud is a visible mass of tiny water droplets or ice crystals suspended in the Earth's atmosphere. Clouds form when warm, moist air rises, cools, and condenses around dust or other particles in the air. They play a crucial role in weather, climate, and the water cycle.

There are several types of clouds, classified by their altitude and shape. Cirrus clouds are thin and wispy, found at high altitudes. Cumulus clouds are fluffy and often indicate fair weather, while stratus clouds form low, gray layers that bring overcast skies or drizzle. Cumulonimbus clouds are tall, dense clouds that produce thunderstorms.

Clouds reflect sunlight, helping to regulate Earth's temperature, and they release precipitation in the form of rain, snow, sleet, or hail. Scientists also study clouds on other planets, like Jupiter’s stormy atmosphere, to better understand weather patterns beyond Earth.
""")
        case .ocean:
            MarkdownText("""
The ocean is a vast body of saltwater covering about 71% of Earth's surface and containing 97% of the planet's water. It is divided into five major oceans: the Pacific, Atlantic, Indian, Southern, and Arctic Oceans. The Pacific Ocean is the largest and deepest, while the Arctic Ocean is the smallest and shallowest.

Oceans play a vital role in climate regulation, absorbing heat and distributing it through currents like the Gulf Stream. They also produce over 50% of Earth's oxygen through marine plants such as phytoplankton.

The ocean is home to millions of species, from tiny microorganisms to massive blue whales. The deep sea remains largely unexplored, with mysterious creatures living in the Mariana Trench, the deepest known part of the ocean.

However, human activities like pollution, overfishing, and climate change threaten ocean ecosystems. Conservation efforts focus on protecting marine life and maintaining ocean health for future generations.
""")
        case .quark:
            MarkdownText("""
A quark is a fundamental particle and one of the building blocks of matter in the Standard Model of particle physics. Quarks combine to form protons and neutrons, which are the components of atomic nuclei. There are six types, or "flavors," of quarks: up, down, charm, strange, top, and bottom.

Each quark has a property called "color charge," which is related to the strong force that holds quarks together inside protons, neutrons, and other hadrons. Quarks are never found in isolation due to a phenomenon known as "confinement"; instead, they always exist in combinations that form composite particles like protons and neutrons.

Quarks also have other properties, such as mass, electric charge, and spin. For instance, up quarks have a charge of +2/3, while down quarks have a charge of -1/3. Understanding quarks and their interactions is key to understanding the fundamental forces of the universe.
""")
        case .cell:
            MarkdownText("""
A cell is the basic unit of life and serves as the fundamental building block of all living organisms. It is the smallest structural and functional unit capable of carrying out essential life processes such as metabolism, growth, reproduction, and response to stimuli. There are two main types of cells: prokaryotic and eukaryotic.

Prokaryotic cells are simpler and smaller. They do not have a defined nucleus or membrane-bound organelles. Organisms like bacteria and archaea are made up of prokaryotic cells. On the other hand, eukaryotic cells are more complex and contain a defined nucleus that stores the cell’s genetic material (DNA). These cells also have membrane-bound organelles, such as mitochondria and the endoplasmic reticulum, which perform specialized functions. Eukaryotic cells are found in organisms such as animals, plants, fungi, and protists.

A typical eukaryotic cell is composed of several key components. The cell membrane is a semi-permeable barrier that controls the movement of substances into and out of the cell. The nucleus serves as the control center of the cell, directing cellular activities and housing DNA. The cytoplasm is the jelly-like substance inside the cell where metabolic processes occur. Organelles within the cell, like ribosomes and mitochondria, are responsible for carrying out specific tasks such as protein synthesis and energy production.

Cells work together to form tissues, which combine to create organs, and ultimately, entire organisms. Each cell type plays a specific role, contributing to the overall function and survival of the organism.
""")
        case .electron:
            MarkdownText("""
An electron is a fundamental particle that carries a negative electric charge. It is one of the key building blocks of matter and is found outside the nucleus of an atom, moving around it in regions called electron clouds or orbitals. Electrons are part of a larger group of particles known as leptons, which are not affected by the strong nuclear force (the force that holds quarks together inside protons and neutrons).

Electrons have very little mass compared to protons and neutrons, roughly 1/1836 of the mass of a proton. Despite their small mass, they play a crucial role in chemical bonding, electricity, and many other physical phenomena.

The electron’s electric charge is essential to the creation of electric fields and currents, which are fundamental to the operation of electronic devices. Electrons also have a property called spin, which is a form of intrinsic angular momentum, and they obey the Pauli exclusion principle, which states that no two electrons can occupy the same quantum state at the same time in a given system.

Electrons move in specific energy levels or shells around the nucleus, and they can absorb or emit energy by jumping between these levels, a process that is crucial for phenomena like light emission (as in neon signs or atomic spectra).
""")
        case .dna:
            MarkdownText("""
DNA (deoxyribonucleic acid) is the molecule that carries the genetic instructions for life. It is present in all living organisms and is responsible for storing and transmitting genetic information across generations. DNA plays a fundamental role in determining an organism’s traits, guiding the growth, development, and functioning of cells.

Structurally, DNA consists of two long strands that form a double helix. Each strand is made up of smaller units called nucleotides, which consist of three components: a sugar molecule (deoxyribose), a phosphate group, and a nitrogenous base. There are four types of nitrogenous bases in DNA: adenine (A), thymine (T), cytosine (C), and guanine (G). These bases pair in a specific way—adenine with thymine (A-T) and cytosine with guanine (C-G)—through hydrogen bonds. This complementary base pairing ensures accurate replication of DNA and the proper transmission of genetic information.

DNA is stored in the nucleus of eukaryotic cells, while in prokaryotic cells, it is found in the cytoplasm. Within the nucleus, DNA is organized into structures called chromosomes, which contain genes—specific sequences of DNA that encode proteins. Proteins, in turn, play a crucial role in carrying out cellular functions. The process of copying DNA before cell division is called replication, ensuring that each new cell receives an identical copy of genetic material.

The expression of genetic information occurs through two main processes: transcription and translation. In transcription, DNA is used as a template to produce messenger RNA (mRNA), which carries genetic instructions to ribosomes. In translation, ribosomes read the mRNA sequence and assemble amino acids to form proteins. These proteins are essential for maintaining life, as they regulate cellular processes, build structures, and facilitate biochemical reactions.

DNA plays a key role in evolution and heredity. Mutations, or changes in the DNA sequence, can lead to genetic variation, which drives natural selection and the evolution of species over time. Additionally, advancements in DNA research have led to breakthroughs in medicine, forensic science, and biotechnology. Techniques such as genetic engineering, gene therapy, and DNA fingerprinting have revolutionized fields like disease treatment, crime investigation, and agriculture.

Overall, DNA is the blueprint of life, encoding the instructions that shape all living organisms and ensuring the continuity of genetic information from one generation to the next.
""")
        case .mercury:
            MarkdownText("""
Mercury is the smallest and innermost planet in the Solar System, orbiting closest to the Sun. It is also the fastest-moving planet, completing one orbit around the Sun in just 88 Earth days. Due to its proximity to the Sun, Mercury experiences extreme temperature variations, with daytime temperatures reaching up to 430°C (800°F) and nighttime temperatures dropping as low as -180°C (-290°F).

Mercury has a rocky, heavily cratered surface, resembling Earth's Moon. This is because it lacks a substantial atmosphere to protect it from meteor impacts or to moderate temperatures. The planet’s thin exosphere is composed mainly of oxygen, sodium, hydrogen, helium, and potassium, but it does not provide significant atmospheric pressure.

A unique feature of Mercury is its slow rotation relative to its orbit. It takes about 59 Earth days to complete one full rotation on its axis, which, combined with its short year, leads to a phenomenon called resonance rotation—where Mercury rotates three times for every two orbits around the Sun. This results in extremely long days and nights.

Mercury also has a large iron core, making up about 85% of its radius, which contributes to its relatively high density. Scientists believe that Mercury once had a thicker outer layer, but much of it was stripped away due to impacts and solar radiation. Despite its small size, Mercury has a weak but detectable magnetic field, suggesting that its core is at least partially molten.

Exploration of Mercury has been challenging due to its proximity to the Sun, which makes sending spacecraft difficult. However, NASA’s Mariner 10 (1974–1975) and MESSENGER (2011–2015) missions provided valuable data about its surface, composition, and magnetic field. The European and Japanese BepiColombo mission, launched in 2018, is expected to arrive at Mercury in 2025 to continue studying the planet in greater detail.

Despite being one of the least explored planets in the Solar System, Mercury holds crucial clues about planetary formation and the early history of our Solar System. Its extreme environment makes it a fascinating target for further scientific research.
""")
        case .venus:
            MarkdownText("""
Venus is the second planet from the Sun and is often called Earth’s “twin” due to its similar size and composition. However, despite these similarities, Venus has a vastly different and extreme environment, making it one of the most hostile planets in the Solar System.
""") +
            Title("Atmosphere and Climate") +
            MarkdownText("""
Venus has a thick, toxic atmosphere composed mainly of carbon dioxide, with clouds of sulfuric acid. This dense atmosphere creates an intense greenhouse effect, trapping heat and making Venus the hottest planet in the Solar System. Surface temperatures can reach 467°C (872°F)—hot enough to melt lead—making it even hotter than Mercury, despite being farther from the Sun.


The thick clouds reflect sunlight efficiently, making Venus the brightest planet in Earth’s night sky. However, this also prevents direct observation of the planet’s surface without the use of radar mapping. The atmospheric pressure on Venus is about 92 times that of Earth’s, equivalent to the pressure found 900 meters (3,000 feet) underwater on Earth.
""") +
            Title("Surface and Geological Features") +
            MarkdownText("""
Beneath its thick atmosphere, Venus has a rocky surface covered in volcanoes, mountains, and vast plains. Some of the largest volcanoes in the Solar System, such as Maat Mons, are found on Venus, and evidence suggests that volcanic activity may still occur today. The surface is also marked by large lava flows, impact craters, and tectonic features, though Venus lacks plate tectonics like Earth.

One of Venus’s most unusual characteristics is its retrograde rotation—it spins in the opposite direction of most planets, meaning the Sun rises in the west and sets in the east. Additionally, Venus has an extremely slow rotation, taking 243 Earth days to complete one spin on its axis, which is longer than its 225-day orbit around the Sun. This means a day on Venus is longer than a year on Venus!
""") +
            Title("Exploration and Mysteries") +
            MarkdownText("""
Venus has been visited by multiple spacecraft, including NASA’s Mariner and Magellan missions, as well as Soviet Venera landers, which successfully transmitted data before being destroyed by the extreme conditions. More recent missions, such as ESA’s Venus Express and Japan’s Akatsuki, have studied its atmosphere and climate. Future missions, including NASA’s VERITAS and ESA’s EnVision, aim to map Venus’s surface in greater detail and study its geological activity.
""") +
            Title("Why Study Venus?") +
            MarkdownText("""
Venus is often studied to understand how greenhouse effects influence planetary climates. Scientists believe Venus may have once had liquid water and a more Earth-like environment, but it underwent extreme atmospheric changes that led to its current state. Studying Venus helps us understand not only our own planet’s climate but also the potential for similar conditions on exoplanets in other star systems.

Despite its harsh environment, Venus remains one of the most intriguing planets, offering valuable insights into planetary evolution and the effects of runaway climate change.
""")
        case .moon:
            MarkdownText("""
The Moon is Earth’s only natural satellite and the fifth-largest moon in the Solar System. It is the closest celestial body to Earth, influencing our planet in many ways, including tides, climate, and even the length of our days. The Moon has been a subject of human fascination for centuries and remains an important target for scientific exploration.
""") +
            Title("Formation and Characteristics") +
            MarkdownText("""
The leading theory for the Moon’s formation is the giant impact hypothesis, which suggests that a Mars-sized object, named Theia, collided with Earth about 4.5 billion years ago. The debris from this impact eventually came together to form the Moon.

The Moon has a diameter of about 3,474 km (2,159 miles), roughly one-quarter the size of Earth. It has only 1/6th of Earth’s gravity, meaning objects weigh much less on its surface. Unlike Earth, the Moon has no significant atmosphere, which means there is no weather, wind, or liquid water on its surface. This lack of atmosphere also means that temperatures vary drastically, reaching 127°C (260°F) during the day and dropping to -173°C (-280°F) at night.
""") +
            Title("Surface and Geology") +
            MarkdownText("""
The Moon’s surface is covered in craters, mountains, valleys, and flat plains called maria. These dark basaltic plains were formed by ancient volcanic activity. The Moon also has highlands, which are older, lighter-colored regions covered in craters.

A notable feature is the South Pole–Aitken Basin, one of the largest known impact craters in the Solar System. Additionally, scientists have discovered water ice in permanently shadowed craters near the lunar poles, which could be used in future space exploration.
""") +
            Title("Phases and Tides") +
            MarkdownText("""
The Moon orbits Earth in about 27.3 days, but due to Earth's motion, a full lunar cycle (from new moon to new moon) takes 29.5 days. The Moon goes through different phases, including new moon, crescent, first quarter, gibbous, full moon, and waning phases. These phases are caused by the changing angles of sunlight reflecting off the Moon’s surface.

Because of tidal locking, the same side of the Moon always faces Earth. The Moon's gravitational pull creates ocean tides, with its influence being strongest during full and new moons, leading to higher tides known as spring tides.
""") +
            Title("Exploration and Future Missions") +
            MarkdownText("""
The Moon was the first celestial body beyond Earth visited by humans. The Apollo missions (1969–1972) sent 12 astronauts to walk on the Moon, starting with Neil Armstrong and Buzz Aldrin during Apollo 11. Robotic landers and orbiters, including those from NASA, the Soviet Union, China, India, and other space agencies, have continued to study the Moon.

Upcoming missions, such as NASA’s Artemis program, aim to return humans to the Moon and establish a sustainable lunar presence as a stepping stone for future Mars exploration. Private companies and international collaborations are also planning lunar bases and resource utilization projects.
""") +
            Title("Significance of the Moon") +
            MarkdownText("""
The Moon plays a crucial role in Earth’s stability, helping to regulate the planet’s axial tilt and climate. It also provides insights into planetary formation, space travel, and even the potential for colonization. With renewed interest in lunar exploration, the Moon remains one of the most important and promising destinations in space science.
""")
        case .mars:
            MarkdownText("""
Mars is the **fourth planet** from the Sun and the second smallest planet in the Solar System, after Mercury. Often called the **"Red Planet"**, Mars has captured human curiosity for centuries due to its **Earth-like features** and the possibility of past or present life.
""") +
            Title("Physical Characteristics and Atmosphere") +
            MarkdownText("""
Mars has a **thin atmosphere** composed mainly of **carbon dioxide (95%)**, with small amounts of nitrogen and argon. Because of this, the planet has **very weak atmospheric pressure**, only about **1% of Earth’s**, meaning liquid water cannot exist on its surface for long. The thin atmosphere also allows heat to escape easily, making Mars **a cold desert planet** with temperatures ranging from **20°C (68°F) at the equator** to **-125°C (-195°F) at the poles**.

The planet’s distinct **red color** comes from iron oxide (rust) on its surface. Mars has **the tallest volcano in the Solar System**, **Olympus Mons**, standing at **26 km (16 miles)**—nearly **three times the height of Mount Everest**. It also has **Valles Marineris**, a vast canyon system stretching over **4,000 km (2,500 miles)**—about **ten times longer** than the Grand Canyon.
""") +
            Title("Water and the Possibility of Life") +
            MarkdownText("""
Evidence suggests that Mars once had **rivers, lakes, and even oceans**, indicating a warmer and wetter past. Today, **water ice** exists at the poles and beneath the surface. In 2018, scientists discovered a **subsurface lake** beneath Mars’ south polar ice cap, raising hopes for microbial life.

While no direct evidence of life has been found, Mars remains a prime candidate for the search for **past or present microbial life** due to its once-habitable conditions.  
""") +
            Title("Moons of Mars") +
            MarkdownText("""
Mars has two small, irregularly shaped moons:
- **Phobos** – The larger moon, which is gradually getting closer to Mars and will eventually crash into the planet or form a ring.  
- **Deimos** – The smaller and more distant moon, with a smoother surface.  

Both moons are likely **captured asteroids** from the asteroid belt.  
""") +
            Title("Exploration of Mars") +
            MarkdownText("""
Mars is one of the most explored planets in the Solar System. Several robotic missions have studied the planet, including orbiters, landers, and rovers.  

- **NASA’s Perseverance rover (2021)** is currently exploring Mars, searching for signs of ancient life and collecting samples for a future return mission.  
- **Curiosity (2012–present)** continues to study the Martian surface and climate.  
- **Ingenuity**, the first helicopter to fly on another planet, has successfully conducted multiple flights on Mars.  

Future missions include NASA and ESA’s **Mars Sample Return mission** and SpaceX’s plans for potential **human colonization** of Mars in the coming decades.  
""") +
            Title("Why Study Mars?") +
            MarkdownText("""
Mars is **the most Earth-like planet** in the Solar System, making it a key target for scientific research and future exploration. Studying Mars helps scientists understand **planetary evolution, climate change, and the potential for extraterrestrial life**. With ongoing missions and future crewed missions planned, Mars could one day become **a second home for humanity**.
""")
        case .jupiter:
            Title("Jupiter: The King of Planets") +
            MarkdownText("""
Jupiter is the **largest planet in the Solar System**, with a mass **more than twice that of all the other planets combined**. It is the **fifth planet** from the Sun and is classified as a **gas giant**, primarily composed of **hydrogen and helium**. Jupiter’s immense size, powerful magnetic field, and iconic storms make it one of the most fascinating celestial objects.  
""") +
            Title("Physical Characteristics and Atmosphere") +
            MarkdownText("""
Jupiter has a **diameter of about 139,820 km (86,880 miles)**, making it **11 times wider than Earth**. It has no solid surface, as it is mostly made of **swirling clouds and dense gases**. The atmosphere is dominated by **hydrogen (90%)** and **helium (10%)**, along with traces of methane, ammonia, and water vapor.

The planet’s most recognizable feature is the **Great Red Spot**, a massive storm that has been raging for over **300 years**. This storm is **larger than Earth** and has powerful winds reaching **over 400 km/h (250 mph)**. Jupiter’s upper atmosphere is divided into colorful **bands of clouds**, creating its signature striped appearance.

Due to its rapid rotation (completing a day in just **9 hours and 56 minutes**), Jupiter has an **extreme equatorial bulge** and powerful jet streams, causing turbulence in its atmosphere.
""") +
            Title("Magnetic Field and Radiation") +
            MarkdownText("""
Jupiter has the **strongest magnetic field** of any planet in the Solar System—about **20,000 times stronger than Earth’s**. This magnetic field creates intense radiation belts, making the planet’s environment extremely hostile to spacecraft and humans. Jupiter also produces **auroras** at its poles, similar to Earth’s Northern and Southern Lights but much more powerful.
""") +
            Title("Jupiter’s Moons") +
            MarkdownText("""
Jupiter has at least **95 known moons**, with four major ones called the **Galilean moons**, discovered by Galileo Galilei in 1610:

- **Io** – The most volcanically active body in the Solar System, with hundreds of erupting volcanoes.  
- **Europa** – Covered in a thick layer of ice, with a subsurface ocean that may contain extraterrestrial life.  
- **Ganymede** – The **largest moon in the Solar System**, even bigger than Mercury, and the only moon with its own magnetic field.  
- **Callisto** – One of the most heavily cratered objects in the Solar System, possibly hiding a subsurface ocean.  

These moons are some of the most interesting places for future space exploration, especially **Europa**, which is considered one of the best places to search for alien life.  
""") +
            Title("Jupiter’s Rings") +
            MarkdownText("""
While Saturn is famous for its rings, Jupiter also has a **faint ring system** made of dust particles. These rings are much **thinner and darker** than Saturn’s and were discovered in **1979** by the **Voyager 1 spacecraft**.
""") +
            Title("Exploration of Jupiter") +
            MarkdownText("""
"Many spacecraft have visited Jupiter, helping scientists understand its complex nature. Notable missions include:

- **Pioneer 10 & 11 (1970s)** – First flybys of Jupiter.  
- **Voyager 1 & 2 (1979)** – Provided detailed images of the planet and its moons.  
- **Galileo (1995–2003)** – First spacecraft to orbit Jupiter, studying its atmosphere and moons.  
- **Juno (2016–present)** – Currently orbiting Jupiter, studying its magnetic field, atmosphere, and internal structure.  

Future missions, such as **NASA’s Europa Clipper (2024 launch)** and ESA’s **JUICE mission (Jupiter Icy Moons Explorer, 2023 launch)**, will focus on studying **Europa and Ganymede** in detail.
""") +
            Title("Why Study Jupiter?") +
            MarkdownText("""
Jupiter is a **key to understanding the formation of the Solar System**. As the largest planet, it played a major role in shaping the orbits of other planets. Its moons, especially Europa, could help answer the question of whether **life exists beyond Earth**. By studying Jupiter, scientists gain insights into **planetary atmospheres, giant planets in other star systems, and the origins of our own Solar System**.
""")
        case .saturn:
            Title("Saturn: The Ringed Giant") +
            MarkdownText("""
Saturn is the **sixth planet from the Sun** and the **second-largest** in the Solar System after Jupiter. It is best known for its **stunning ring system**, which makes it one of the most visually striking planets. Like Jupiter, Saturn is a **gas giant**, primarily composed of **hydrogen and helium**, with no solid surface.  
""") +
            Title("Physical Characteristics and Atmosphere") +
            MarkdownText("""
"Saturn has a **diameter of about 120,500 km (74,900 miles)**, making it **9.5 times wider than Earth**. Despite its massive size, Saturn is the **least dense planet in the Solar System**, with an average density lower than water—meaning that if there were a large enough ocean, Saturn would **float**!

The planet’s atmosphere consists mostly of **hydrogen (96%) and helium (3%)**, along with traces of methane and ammonia. Saturn’s clouds form **beautiful bands and storms**, though they appear more subtle compared to Jupiter’s bold stripes. One of the most remarkable weather patterns on Saturn is its **hexagonal storm** at the **north pole**, a massive six-sided jet stream first discovered by Voyager in the 1980s.  

Saturn experiences **powerful winds**, reaching speeds of **1,800 km/h (1,120 mph)**—faster than those on Jupiter or Earth. It also has **occasional superstorms**, such as the "Great White Spot," a giant storm that appears roughly every 30 years.  
""") +
            Title("Saturn’s Rings") +
            MarkdownText("""
Saturn’s **rings are the most extensive and spectacular in the Solar System**. They are made up of countless ice and rock particles, ranging in size from tiny grains to large chunks **as big as a house**. The rings span over **273,000 km (170,000 miles) in diameter** but are only about **10 meters (30 feet) thick** in some places.

The rings are divided into several sections, with the **A, B, and C rings** being the most prominent. The **Cassini Division**, a dark gap between the A and B rings, is one of Saturn’s most famous features. Scientists believe the rings are relatively **young, possibly only 100 million years old**, and may have formed from a **destroyed moon or comet**.  
""") +
            Title("Saturn’s Moons") +
            MarkdownText("""
Saturn has at least **146 confirmed moons**, with **Titan** being the largest and one of the most intriguing in the Solar System. Some of the most notable moons include:

- **Titan** – Saturn’s largest moon, bigger than Mercury. It has a **thick nitrogen-rich atmosphere** and **seas of liquid methane and ethane**, making it a key target for the search for extraterrestrial life.  
- **Enceladus** – A small icy moon that **shoots water vapor and ice from its subsurface ocean** into space. This makes Enceladus one of the most promising places to search for **alien life**.  
- **Mimas** – A heavily cratered moon that looks like the **Death Star** from *Star Wars* due to its giant impact crater, **Herschel**.  
- **Iapetus** – A two-toned moon, with one half as dark as coal and the other as bright as snow.  
- **Rhea, Dione, and Tethys** – Icy moons with surface features such as ridges, valleys, and possible underground oceans.  

Several of these moons, especially **Titan and Enceladus**, are among the top candidates for **future space exploration** due to their potential for supporting life.  
""") +
            Title("Magnetic Field and Weather") +
            MarkdownText("""
Saturn has a **strong but weaker magnetic field** than Jupiter’s. However, it still generates **auroras** at its poles, similar to Earth’s Northern and Southern Lights. Saturn's rapid rotation (a day lasts **about 10.7 hours**) and deep atmosphere contribute to its dynamic weather patterns.
""") +
            Title("Exploration of Saturn") +
            MarkdownText("""
Several spacecraft have visited Saturn, providing valuable insights into the planet and its moons:

- **Pioneer 11 (1979)** – First spacecraft to fly past Saturn.  
- **Voyager 1 & 2 (1980-1981)** – Sent back the first detailed images of the planet, its rings, and moons.  
- **Cassini-Huygens (2004-2017)** – The most significant mission to Saturn. The Cassini orbiter spent **13 years studying Saturn**, while the **Huygens probe** landed on Titan in 2005, sending back images and data from its mysterious surface.  

The Cassini mission provided crucial discoveries, including **water plumes on Enceladus**, detailed studies of Saturn’s rings, and atmospheric observations of Titan.  

Future missions, such as **NASA’s Dragonfly (set to launch in 2027)**, will send a flying drone to **Titan** to explore its terrain and search for signs of life.  
""") +
            Title("Why Study Saturn?") +
            MarkdownText("""
Saturn is a **key to understanding planetary formation and evolution**. Its **ring system, diverse moons, and dynamic atmosphere** provide insights into the history of the Solar System. Moons like **Titan and Enceladus** could hold the answers to whether **life exists beyond Earth**.

With future missions planned and new discoveries constantly being made, Saturn remains one of the most **mysterious and exciting** planets for scientists and space explorers alike.
""")
        case .uranus:
            Title("Uranus: The Ice Giant") +
            MarkdownText("""
Uranus is the **seventh planet from the Sun** and the **third-largest** in the Solar System. It is classified as an **ice giant**, along with Neptune, due to its high concentration of **icy materials** like water, ammonia, and methane. What makes Uranus unique is that it **rotates on its side**, with an extreme tilt of **98 degrees**, making it the most tilted planet in the Solar System.
""") +
            Title("Physical Characteristics and Atmosphere") +
            MarkdownText("""
Uranus has a **diameter of about 50,700 km (31,500 miles)**, making it **four times wider than Earth**. It is mostly composed of **hydrogen and helium**, but unlike Jupiter and Saturn, it contains a much larger proportion of **"ices"**—water, methane, and ammonia—deep within its interior.

The **blue-green color** of Uranus comes from **methane** in its atmosphere, which absorbs red light and reflects blue and green light. However, unlike other gas giants, Uranus has a **very bland atmosphere** with few visible clouds or storms.  

Despite its calm appearance, Uranus has **violent wind speeds**, reaching up to **900 km/h (560 mph)**. The planet also experiences **extreme seasons** due to its tilt. Each pole spends **42 years in continuous sunlight**, followed by **42 years of darkness**.  
""") +
            Title("Axial Tilt and Rotation") +
            MarkdownText("""
Uranus’s **unique sideways rotation** is one of the biggest mysteries of the Solar System. Scientists believe it was caused by a **massive collision** with an Earth-sized object early in its history. This impact could have knocked the planet onto its side, altering its rotation forever.

- **A day on Uranus** lasts **17.2 hours**.  
- **A year on Uranus** (one orbit around the Sun) takes **84 Earth years**.  

Due to this tilt, Uranus **essentially rolls around the Sun** rather than spinning like the other planets. This causes **one hemisphere to experience decades of continuous sunlight**, followed by decades of darkness.  
""") +
            Title("Rings and Moons") +
            MarkdownText("""
Uranus has **13 known rings**, which are **thin, dark, and faint**, making them difficult to observe. Unlike the bright icy rings of Saturn, Uranus's rings are composed mostly of **dark, rocky material**.

The planet also has **27 known moons**, named after characters from **Shakespearean plays and Alexander Pope’s poetry**. Some of the most notable include:  

- **Titania** – The largest moon of Uranus, with **deep canyons and possible subsurface oceans**.  
- **Oberon** – The second-largest moon, covered in impact craters.  
- **Ariel** – A bright moon with smooth plains and **evidence of past geological activity**.  
- **Umbriel** – A dark and heavily cratered moon, possibly containing ancient ice deposits.  
- **Miranda** – The most geologically active of Uranus’s moons, featuring **huge cliffs, valleys, and ridges**, possibly caused by past **violent collisions**.  
""") +
            Title("Magnetic Field and Weather") +
            MarkdownText("""
Unlike Earth’s magnetic field, which is aligned with its rotation, Uranus's **magnetic field is tilted at a 59-degree angle** and is **off-center** from the planet’s core. This creates **a chaotic and unpredictable magnetosphere**, with constantly shifting auroras.

Uranus’s atmosphere was once thought to be calm, but later observations revealed **powerful storms**. Some storms have been detected **deep within the planet**, hinting at complex atmospheric dynamics.  
""") +
            Title("Exploration of Uranus") +
            MarkdownText("""
Uranus remains **one of the least explored planets** in the Solar System. The only spacecraft to visit Uranus was **Voyager 2 in 1986**, which provided **the first and only close-up images** of the planet and its moons. Since then, no spacecraft has returned, but astronomers continue to study Uranus using telescopes like Hubble and ground-based observatories.

NASA and other space agencies have proposed **future missions** to Uranus, possibly including **orbiter and probe missions** in the 2030s to study its atmosphere, rings, and moons in detail.  
""") +
            Title("Why Study Uranus?") +
            MarkdownText("""
Uranus is a **key to understanding ice giant planets**, which are common in other star systems. Studying Uranus could provide insights into **planetary formation, extreme climates, and even exoplanets**. Its **moons, particularly Titania and Miranda**, could also hold clues about **subsurface oceans and potential habitability**.

With its **mysterious sideways rotation, strange magnetic field, and unexplored moons**, Uranus remains one of the **most intriguing and least understood** planets in our Solar System.
""")
        case .neptune:
            Title("Neptune: The Mysterious Ice Giant") +
            MarkdownText("""
Neptune is the **eighth and farthest planet from the Sun** in our Solar System. It is the **fourth-largest planet by diameter** and the **third most massive**, making it slightly smaller but denser than Uranus. Neptune is classified as an **ice giant**, with a thick atmosphere of **hydrogen, helium, and methane**, and it is known for its **deep blue color and extreme weather**.  
""") +
            Title("Physical Characteristics and Atmosphere") +
            MarkdownText("""
Neptune has a **diameter of about 49,244 km (30,598 miles)**, making it **almost four times wider than Earth**. Like Uranus, it is composed mainly of **hydrogen, helium, and "ices"** such as water, ammonia, and methane.  

The planet's **deep blue color** comes from **methane in the upper atmosphere**, which absorbs red light and reflects blue light. However, scientists believe **another unknown atmospheric component** may also contribute to its intense blue appearance.  

Neptune’s atmosphere is **one of the most active** in the Solar System, with **supersonic winds reaching up to 2,100 km/h (1,300 mph)**—the fastest winds recorded on any planet. These storms and wind patterns give Neptune a **dynamic and ever-changing appearance**.  
""") +
            Title("Storms and Weather") +
            MarkdownText("""
Neptune experiences **gigantic storms** that can last for years. The most famous was the **Great Dark Spot**, a massive storm similar to Jupiter’s Great Red Spot, observed by Voyager 2 in 1989. However, when the Hubble Space Telescope looked for it in the 1990s, it had disappeared—suggesting that Neptune's storms **form and dissipate much more quickly** than Jupiter’s.  

Scientists have also observed **smaller dark spots** and **white clouds**, possibly made of methane ice, moving through Neptune’s atmosphere at **incredible speeds**.  

Despite being **farther from the Sun** than Uranus, Neptune is actually **warmer**, possibly due to an **internal heat source** that Uranus lacks. This heat helps drive the planet’s **violent weather patterns**.  
""") +
            Title("Rotation and Orbit") +
            MarkdownText("""
- **A day on Neptune** (one full rotation) takes **16 hours**.
- **A year on Neptune** (one orbit around the Sun) lasts **165 Earth years**.  

Since its discovery in **1846**, Neptune has only completed **one full orbit around the Sun** (in 2011).  

Neptune also has an **axial tilt of 28 degrees**, similar to Earth’s, which means it experiences **seasons**—although each season lasts over **40 years** due to its long orbital period.  
""") +
            Title("Rings and Moons") +
            MarkdownText("""
Neptune has a system of **six known rings**, which are **faint and made of dark material**. These rings are **not uniform**; some sections are **denser than others**, possibly due to gravitational interactions with nearby moons.

The planet has **14 known moons**, with **Triton** being the most fascinating.  

**Triton: Neptune’s Largest Moon**  

Triton is **unlike any other large moon in the Solar System**.  

- It orbits Neptune in a **retrograde motion**, meaning it moves **opposite to Neptune’s rotation**, suggesting it was **captured** rather than forming alongside Neptune.  
- Triton has **active geysers** that **spew nitrogen gas**, making it one of the few geologically active moons in the Solar System.  
- It has a **thin atmosphere**, mostly nitrogen, similar to Saturn’s moon Titan.  
- Scientists believe Triton **could have once been a dwarf planet**, like Pluto, before being captured by Neptune’s gravity.  

Due to **Triton’s retrograde orbit**, it is slowly spiraling inward and will **eventually collide with Neptune** in **millions of years**.
""") +
            Title("Magnetic Field") +
            MarkdownText("""
Neptune’s magnetic field is **strangely tilted** by **47 degrees** from its rotational axis, similar to Uranus’s unusual magnetic field. This suggests that **the planet’s magnetic field is generated in a different way** than Earth's. The tilted field creates **irregular and shifting auroras**, unlike the stable auroras seen on planets like Jupiter and Earth.  
""") +
            Title("Exploration of Neptune") +
            MarkdownText("""
"Neptune has only been visited **once**, by **Voyager 2** in **1989**. The spacecraft captured **stunning images** of the planet, its rings, and its moons, revealing many details that were previously unknown.  

Since then, Neptune has been observed using telescopes like the **Hubble Space Telescope** and ground-based observatories, but no new spacecraft has visited.  

There have been **proposals for future missions** to Neptune, possibly including **orbiters and probes** to study its atmosphere, rings, and moons in more detail.  
""") +
            Title("Why Study Neptune?") +
            MarkdownText("""
Neptune is a **key to understanding ice giant planets**, which are **common in other star systems**. Studying Neptune can help scientists understand:  

- **Extreme weather patterns** on giant planets.  
- **The structure and evolution of ice giants**.  
- **Mysterious magnetic fields**.  
- **Triton’s unique geology** and its potential as a captured Kuiper Belt object.  

With its **intense storms, powerful winds, and mysterious moon Triton**, Neptune remains **one of the most fascinating and least explored planets** in the Solar System.
""")
        case .neutrons:
            Title("Neutrons: The Neutral Building Blocks of Atoms") +
            MarkdownText("""
Neutrons are **subatomic particles** that, along with **protons**, form the **nucleus** of an atom. Unlike protons, neutrons have **no electric charge**, making them **electrically neutral**. They play a crucial role in **atomic stability, nuclear reactions, and fundamental physics**.  
""") +
            Title("Basic Properties of Neutrons") +
            MarkdownText("""
- **Charge:** 0 (neutral)
- **Mass:** About **1.675 × 10⁻²⁷ kg**, slightly more than a proton but nearly **1,839 times the mass of an electron**.  
- **Location:** Found in the **atomic nucleus** (except in hydrogen-1, which has only a proton).  
- **Spin:** ½ (a property of quantum mechanics, meaning neutrons behave like tiny magnets).  

Neutrons help **stabilize atomic nuclei** by balancing the repulsive forces between positively charged protons. Without neutrons, many atomic nuclei would **break apart** due to the repulsion between protons.  
""") +
            Title("Neutrons in Atoms") +
            MarkdownText("""
The **number of neutrons** in an atom can vary, leading to different **isotopes** of an element. For example:  

- **Carbon-12** has **6 protons** and **6 neutrons**.  
- **Carbon-14**, a radioactive isotope, has **6 protons** and **8 neutrons**.  

The number of neutrons **does not affect the chemical properties** of an element but influences its **stability and radioactivity**.  
""") +
            Title("Free Neutrons and Radioactive Decay") +
            MarkdownText("""
Neutrons are **stable inside the nucleus** of an atom, but when they exist **outside** of a nucleus, they are **unstable**. A **free neutron** has a half-life of about **10 minutes and 11 seconds** before it undergoes **beta decay**, transforming into:  

neutron -> proton + electron + antineutrino

This process is important in **nuclear reactions, radioactive decay, and particle physics**.  
""") +
            Title("Neutrons in Nuclear Reactions") +
            MarkdownText("""
"Neutrons play a critical role in **nuclear fission and fusion**, which are processes that release enormous amounts of energy.  

**Nuclear Fission (Used in Nuclear Power and Bombs)**  
- In fission, a **heavy atomic nucleus** (like uranium-235 or plutonium-239) absorbs a neutron, becomes unstable, and **splits** into smaller nuclei.  
- This releases **energy** and additional **free neutrons**, which can continue the reaction in a **chain reaction**.  
- This process is used in **nuclear power plants** and **atomic bombs**.  

**Nuclear Fusion (Occurs in Stars)**  
- In fusion, **light atomic nuclei** (like hydrogen isotopes) combine to form a **heavier nucleus**, releasing **tremendous energy**.  
- Neutrons are often released during fusion reactions, such as those occurring in the **Sun and hydrogen bombs**.  
""") +
            Title("Discovery of the Neutron") +
            MarkdownText("""
The neutron was **discovered in 1932** by **James Chadwick**, who found that an unknown neutral particle was present in the nucleus. This discovery helped explain **atomic mass differences** and led to major advancements in **nuclear physics**.  
""") +
            Title("Applications of Neutrons") +
            MarkdownText("""
"1. **Nuclear Power:** Neutrons drive the fission process in **nuclear reactors**, producing electricity.
2. **Medical Uses:** Neutron radiation is used in **cancer treatment (neutron therapy)** and medical imaging.
3. **Scientific Research:** Neutron scattering is used to study **materials, proteins, and atomic structures**.  
4. **Weapons:** Neutrons play a role in **nuclear weapons** by sustaining chain reactions.  
5. **Space Exploration:** Neutron detectors help analyze **the composition of planets and asteroids**.  
""") +
            Title("Neutrons and the Universe") +
            MarkdownText("""
- **Neutron Stars:** When massive stars explode in supernovae, their cores can collapse into **neutron stars**, where neutrons are packed so tightly that a teaspoon of neutron star material **weighs billions of tons**.  
- **Big Bang Nucleosynthesis:** Neutrons played a role in forming the first elements in the **early universe**, helping create **hydrogen and helium nuclei**.
""") +
            Title("Conclusion") +
            MarkdownText("""
Neutrons may not carry an electric charge, but they are **essential to atomic structure, nuclear energy, and the very fabric of the universe**. From **stabilizing atoms** to powering **nuclear reactions**, they are fundamental to understanding **both the smallest particles and the largest cosmic phenomena**.
""")
        case .protons:
            Title("Protons: The Positively Charged Building Blocks of Atoms") +
            MarkdownText("""
Protons are **subatomic particles** that, along with **neutrons**, form the **nucleus** of an atom. They carry a **positive electric charge** and play a crucial role in **determining an element’s identity, atomic stability, and chemical behavior**.  
""") +
            Title("Basic Properties of Protons") +
            MarkdownText("""
- **Charge:** +1 (positive)  
- **Mass:** About **1.673 × 10⁻²⁷ kg**, nearly **1,836 times the mass of an electron**, but slightly less than a neutron.  
- **Location:** Found in the **atomic nucleus**.  
- **Spin:** 1/2 (a property related to quantum mechanics, affecting interactions with other particles).  

Protons, along with neutrons, form the **core of an atom**, while **electrons** orbit around the nucleus in **energy levels** or **shells**.  
""") +
            Title("Protons and Atomic Number") +
            MarkdownText("""
The **number of protons** in an atom’s nucleus is called the **atomic number (Z)**. This **defines an element** on the **periodic table**. For example:  

- **Hydrogen (H):** 1 proton  
- **Carbon (C):** 6 protons  
- **Oxygen (O):** 8 protons  
- **Gold (Au):** 79 protons  

An atom’s **chemical properties** are determined primarily by the number of **protons and electrons**. If the number of protons changes, the atom becomes a **different element**.  
""") +
            Title("Protons in Atomic Nuclei") +
            MarkdownText("""
Protons are **held together with neutrons** in the nucleus by the **strong nuclear force**, which is the **strongest force in nature**. This force **overcomes** the natural repulsion between positively charged protons.  

The ratio of **protons to neutrons** affects an atom’s **stability**. If an atom has too many or too few neutrons, it may become **radioactive** and undergo **nuclear decay**.  
""") +
            Title("Discovery of the Proton") +
            MarkdownText("""
"The proton was first identified in **1917** by **Ernest Rutherford**, who discovered that when alpha particles hit nitrogen, they produced **hydrogen nuclei**. He concluded that hydrogen nuclei must be **a fundamental building block of all atoms** and named them **protons**.  
""") +
            Title("Protons and Nuclear Reactions") +
            MarkdownText("""
"Protons play a key role in **nuclear fusion, fission, and decay**:  

**1. Nuclear Fusion (Stars & the Sun)**  
- In the Sun, **hydrogen nuclei (protons)** fuse together to form **helium**, releasing massive amounts of **energy**.  
- This **powers the Sun and all stars**, producing heat and light.  

**2. Nuclear Fission (Power & Bombs)**  
- In **nuclear fission**, a **heavy nucleus** (like uranium-235) splits, releasing **energy** and additional **protons and neutrons**.  
- This is used in **nuclear power plants** and **atomic bombs**.  

**3. Proton Decay (Hypothetical)**  
- Some theories suggest that protons might **decay** over an extremely long time, but this has not yet been observed.  
""") +
            Title("Protons in Everyday Life") +
            MarkdownText("""
"1. **Electricity & Chemistry:** The **balance of protons and electrons** determines **charge** and **chemical reactions**.
2. **Medicine:** **Proton therapy** is used to treat **cancer**, delivering targeted radiation to tumors.  
3. **Scientific Research:** **Particle accelerators**, like the **Large Hadron Collider (LHC)**, study **protons** to explore the fundamental forces of the universe.  
4. **Space Exploration:** **Proton detectors** help study **solar winds and cosmic rays**.  
""") +
            Title("Protons and the Universe") +
            MarkdownText("""
- **Protons in the Big Bang:** After the Big Bang, protons were among the first particles to form, leading to the creation of **hydrogen, helium, and all elements**.  
- **Proton-Rich Cosmic Rays:** High-energy **protons** are found in **cosmic rays**, impacting Earth's atmosphere.
""") +
            Title("Conclusion") +
            MarkdownText("""
Protons are **fundamental to the structure of matter**, defining **chemical elements**, **powering the Sun**, and **shaping the universe**. Their study continues to unlock **new discoveries in physics, chemistry, and cosmology**.
""")
        case .phone:
            Title("The Phone: A Revolutionary Communication Device") +
            MarkdownText("""
A **phone** is a **communication device** that allows people to talk, send messages, and access information over long distances. Phones have evolved from simple **wired landlines** to **powerful smartphones**, shaping modern communication, business, and daily life.  
""") +
            SubTitle("**1. Early Telephones: The Invention That Changed the World**") +
            MarkdownText("""
The first practical telephone was invented by **Alexander Graham Bell** in **1876**. His invention allowed **real-time voice communication** over wires, replacing slower methods like letters and telegraphs. Early telephones required **manual operators** to connect calls.  

- **1880s:** Telephone exchanges introduced, allowing automatic connections.  
- **1900s:** Rotary dial phones replaced operator-based calling.  
- **1960s:** Touch-tone dialing (keypad) introduced, replacing rotary dials.  
""") +
            SubTitle("**2. The Rise of Mobile Phones**") +
            MarkdownText("""
"The first **mobile phone** was developed by **Motorola** in **1973**, but it was bulky and expensive. Over time, mobile phones became **smaller, cheaper, and more powerful**.  

- **1980s:** Early mobile phones were used in cars and by businesses.  
- **1990s:** Flip phones became popular; SMS (text messaging) was introduced.  
- **2000s:** Smartphones emerged, combining calling, messaging, and internet access.  
""") +
            SubTitle("**3. Smartphones: The Digital Revolution**") +
            MarkdownText("""
"Today’s **smartphones** are powerful **mini-computers** that fit in a pocket. They offer:  

- **Touchscreens** for easy interaction.  
- **High-speed internet** for browsing, social media, and streaming.  
- **Apps** for communication, work, health, and entertainment.  
- **Cameras** that rival professional photography.      
""") +
            SubTitle("**4. Impact of Phones on Society**") +
            MarkdownText("""
"Phones have changed how people **communicate, work, and live**:

- **Instant communication** through calls, texts, and video chats.  
- **Global business** with remote work and online meetings.  
- **Emergency services** with quick access to help.  
- **Social media & entertainment** with apps like Instagram, TikTok, and YouTube.  
- **Education & learning** through e-books, online courses, and language apps.  

However, excessive phone use can lead to **addiction, distraction, and privacy concerns**.  
""") +
            SubTitle("**5. The Future of Phones**") +
            MarkdownText("""
"Phones continue to evolve with **new technology**:  

- **Foldable screens** for larger displays.  
- **5G networks** for ultra-fast internet.  
- **Augmented Reality (AR) & Virtual Reality (VR)** for immersive experiences.  
- **AI & smart assistants** for automation and convenience.  
- **Holographic displays** for futuristic interactions.  
""") +
            SubTitle("**Conclusion**") +
            MarkdownText("""
"Phones have transformed from **simple communication tools** to **powerful smart devices** that connect the world. As technology advances, phones will continue to revolutionize **how we interact, learn, and work in the digital age**.
""")
        case .computer:
            Title("**The Computer: A Powerful Machine That Changed the World**") +
            MarkdownText("""
A **computer** is an electronic device that processes data and performs tasks based on instructions. Computers have evolved from massive machines used for calculations to compact, powerful devices essential in everyday life. They play a crucial role in communication, business, entertainment, science, and artificial intelligence.
""") +
            Title("**1. The History of Computers**") +
            MarkdownText("""
Computers have gone through several generations of development:

- **Early Mechanical Computers (1600s–1800s)**: Devices like the **abacus** and **Charles Babbage’s Analytical Engine** laid the foundation for modern computing.  
- **First Generation (1940s–1950s)**: **Vacuum tube-based computers** like the **ENIAC** were massive, slow, and consumed a lot of power.  
- **Second Generation (1950s–1960s)**: **Transistors replaced vacuum tubes**, making computers smaller and faster.  
- **Third Generation (1960s–1970s)**: **Integrated circuits (ICs)** further improved speed and efficiency.  
- **Fourth Generation (1970s–Present)**: **Microprocessors** led to the development of **personal computers (PCs)** and laptops.  
- **Fifth Generation (Present & Future)**: AI, quantum computing, and neural networks are shaping the future.  
""") +
            Title("**2. Types of Computers**") +
            MarkdownText("""
Computers come in many forms, each designed for different purposes:  
""") +
            SubTitle("**A. Personal Computers (PCs) & Laptops**") +
            MarkdownText("""
- Used for work, gaming, and entertainment.
- Operating systems like **Windows, macOS, and Linux** power them.  
""") +
            SubTitle("**B. Supercomputers**") +
            MarkdownText("""
- Extremely powerful machines used for **weather forecasting, scientific research, and space exploration**.
- Example: **IBM Summit, Fugaku Supercomputer**.  
""") +
            SubTitle("**C. Servers**") +
            MarkdownText("""
- Store and process large amounts of data for websites, businesses, and cloud services.
""") +
            SubTitle("**D. Embedded Systems**") +
            MarkdownText("""
- Small computers inside **cars, appliances, and smart devices** that perform specific tasks.
""") +
            SubTitle("**E. Quantum Computers** (Future Technology)") +
            MarkdownText("""
- Use quantum bits (**qubits**) to process data exponentially faster than traditional computers.
""") +
            Title("**3. Components of a Computer**") +
            MarkdownText("""
A computer consists of **hardware and software** that work together to perform tasks.
""") +
            SubTitle("**A. Hardware (Physical Parts)**") +
            MarkdownText("""
- **Central Processing Unit (CPU):** The “brain” of the computer that processes data.
- **Memory (RAM):** Temporarily stores data for fast access.  
- **Storage (HDD/SSD):** Stores files, programs, and operating systems.  
- **Graphics Processing Unit (GPU):** Handles visual processing for gaming and design.  
- **Input Devices:** Keyboard, mouse, touchscreen, etc.  
- **Output Devices:** Monitor, speakers, printer, etc.  
""") +
            SubTitle("**B. Software (Programs & Applications)**") +
            MarkdownText("""
- **Operating System (OS):** Manages hardware and software (e.g., Windows, macOS, Linux).
- **Applications:** Programs like web browsers, games, and productivity tools.  
- **Programming Languages:** Code used to develop software (e.g., Python, Java, C++).  
""") +
            Title("**4. How Computers Impact Society**") +
            MarkdownText("""
Computers have transformed nearly every aspect of modern life:

- **Communication:** Email, video calls, and social media connect people worldwide.  
- **Education:** Online learning, digital libraries, and AI tutors.  
- **Healthcare:** Medical imaging, robotic surgery, and patient records management.  
- **Business:** E-commerce, digital banking, and automated processes.  
- **Entertainment:** Video streaming, gaming, and music production.  
- **Artificial Intelligence (AI):** Smart assistants, chatbots, and machine learning.  
""") +
            Title("**5. The Future of Computers**") +
            MarkdownText("""
Technology is advancing rapidly, and the future of computers includes:

- **Quantum Computing:** Solving complex problems much faster than traditional computers.  
- **Artificial Intelligence (AI):** More advanced automation, robotics, and decision-making.  
- **Brain-Computer Interfaces (BCI):** Direct communication between the brain and machines.  
- **Smarter, Faster, Smaller Devices:** Improved efficiency and portability.  
""") +
            Title("**Conclusion**") +
            MarkdownText("""
Computers have revolutionized the world, making life more efficient, connected, and innovative. From simple calculators to advanced AI-driven machines, computers continue to shape the future of technology and human progress.
""")
        case .lightBulb:
            Title("**The Lightbulb: An Invention That Illuminated the World**") +
            MarkdownText("""
The **lightbulb** is one of the most transformative inventions in human history. It revolutionized the way people live, work, and interact by providing reliable and efficient illumination. From its early development to modern LED technology, the lightbulb continues to evolve and impact everyday life.
""") +
            Title("**1. The History of the Lightbulb**") +
            MarkdownText("""
The development of the lightbulb involved many inventors and innovations:

- **Early Experiments (1800s)**: Humphry Davy created the first incandescent light using a platinum filament.  
- **Thomas Edison (1879)**: Edison improved the design with a carbon filament, making the lightbulb practical and long-lasting.  
- **Nikola Tesla & AC Power**: Tesla's work in alternating current (AC) electricity helped expand the reach of electric lighting.  
- **Modern Advancements**: LED bulbs and smart lighting have made illumination more energy-efficient and customizable.  
""") +
            Title("**2. Types of Lightbulbs**") +
            MarkdownText("""
Lightbulbs come in different types, each suited for specific applications:
""") +
            SubTitle("**A. Incandescent Bulbs**") +
            MarkdownText("""
- Traditional bulbs with a tungsten filament.
- Produces warm light but consumes more energy.
""") +
            SubTitle("**B. Fluorescent Bulbs**") +
            MarkdownText("""
- Uses a gas-filled tube and phosphor coating.
- More energy-efficient than incandescent bulbs.
""") +
            SubTitle("**C. LED Bulbs**") +
            MarkdownText("""
- Uses light-emitting diodes (LEDs) for illumination.
- Extremely energy-efficient and long-lasting.
""") +
            SubTitle("**D. Smart Bulbs**") +
            MarkdownText("""
- Can be controlled via smartphone apps or voice assistants.
- Offers features like color changing and dimming.
""") +
            Title("**3. How Lightbulbs Work**") +
            MarkdownText("""
A lightbulb converts electrical energy into light using different principles:

- **Incandescent Bulbs**: Heat a filament until it glows.  
- **Fluorescent Bulbs**: Excite gas atoms to emit ultraviolet light, which a phosphor coating turns into visible light.  
- **LED Bulbs**: Pass an electric current through semiconductors to emit light.  
""") +
            Title("**4. The Impact of Lightbulbs on Society**") +
            MarkdownText("""
The invention of the lightbulb has had profound effects on modern society:

- **Extended Work Hours**: Factories, businesses, and homes can operate efficiently at night.  
- **Improved Safety**: Well-lit streets and buildings reduce accidents and crime.  
- **Advancements in Technology**: LED and smart lighting contribute to energy conservation and automation.  
- **Cultural and Artistic Influence**: Lighting design enhances architecture, events, and media production.  
""") +
            Title("**5. The Future of Lightbulbs**") +
            MarkdownText("""
Lighting technology continues to advance, focusing on sustainability and efficiency:

- **Solar-Powered Lighting**: Off-grid solutions for remote areas.  
- **Smart and Adaptive Lighting**: AI-controlled brightness and color adjustments.  
- **Bioluminescent Light Sources**: Innovations using organic materials for illumination.  
""") +
            Title("**Conclusion**") +
            MarkdownText("""
From its invention to modern innovations, the lightbulb remains a symbol of progress and human ingenuity. With new developments in energy-efficient and smart lighting, the future of illumination continues to shine bright.
""")
            
        }
    }
}

private func MarkdownText(_ value: String) -> Text {
    Text(.init(value + "\n"))
}

private func Title(_ value: String) -> Text {
    MarkdownText("\n" + value).font(.title2).bold()
}

private func SubTitle(_ value: String) -> Text {
    MarkdownText("\n" + value).font(.headline).bold()
}
