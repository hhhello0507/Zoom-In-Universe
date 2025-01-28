//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import Foundation

enum Destination {
    case multiVerse
    case universe
    case supercluster
    case galaxyCluster
    case galaxy
    case blackHole
    case starCluster
    case solarSystem
    case inSolarSystem
    case earth
    case inEarth
    
    var text: String {
        switch self {
        case .multiVerse: "MultiVerse"
        case .universe: "Universe"
        case .supercluster: "Supercluster"
        case .galaxyCluster: "GalaxyCluster"
        case .galaxy: "Galaxy"
        case .blackHole: "BlackHole"
        case .starCluster: "StarCluster"
        case .solarSystem: "SolarSystem"
        case .inSolarSystem: "SolarSystem"
        case .earth: "Earth"
        case .inEarth: "InEarth"
        }
    }
    
    var description: String {
        switch self {
        case .multiVerse:
"""
The multiverse is a captivating concept that spans science, philosophy, and fiction. It suggests that our universe might be just one among countless others, each with its own unique properties and characteristics.

From a scientific perspective, the multiverse arises in various theories. In inflationary cosmology, the rapid expansion of space after the Big Bang could create "bubble universes," where each bubble forms its own universe with distinct physical laws. The many-worlds interpretation of quantum mechanics proposes that every quantum event branches into parallel realities, leading to an infinite number of alternate outcomes. Similarly, string theory hints at the possibility of multiple dimensions and diverse universes emerging from different configurations of these dimensions.

Philosophically, the multiverse challenges our understanding of existence and identity. If multiple versions of "you" exist in different universes, what does that mean for free will, individuality, or even morality? Some thinkers argue that the multiverse could explain why our universe is fine-tuned for life—it may simply be one of the few where life can exist, out of countless others with varying conditions.

In fiction, the multiverse serves as an exciting narrative tool. It’s explored in films like Doctor Strange in the Multiverse of Madness and Everything Everywhere All at Once, where characters navigate alternate realities. Comic book universes like Marvel and DC frequently use the multiverse to introduce alternate storylines and versions of beloved characters. In literature, works like The Long Earth series by Terry Pratchett and Stephen Baxter imagine how humanity might access and explore parallel worlds.

Speculating about the multiverse leads to intriguing questions. Could technology ever allow us to travel between universes? If so, what implications would that have for science and society? On a philosophical level, does the existence of a multiverse make our universe less special, or does it highlight the diversity and complexity of existence? Scientifically, evidence for the multiverse remains indirect and highly debated. Proving its existence may forever elude us, but the concept continues to inspire thought and innovation.

The multiverse, whether a scientific reality, philosophical puzzle, or creative inspiration, pushes the boundaries of how we understand the universe and our place within it.
"""
        case .universe:
"""
The universe is everything that exists: all matter, energy, space, and time. It's vast and mysterious, inspiring both scientific exploration and philosophical wonder. Here's a detailed look at its key aspects:

The universe began approximately 13.8 billion years ago with the Big Bang, a massive expansion from an extremely hot, dense state. This event marks the origin of space, time, and the fundamental forces of nature. Since then, the universe has been expanding, with galaxies moving farther apart over time. Observations of this expansion have led to the discovery of dark energy, a mysterious force accelerating the universe's growth.

At its core, the universe is made up of three main components: ordinary matter, dark matter, and dark energy. Ordinary matter, which includes atoms and everything we see, makes up only about 5% of the universe. Dark matter, an invisible substance detectable through its gravitational effects, constitutes roughly 27%. The remaining 68% is dark energy, driving the accelerated expansion of the universe.

The structure of the universe is awe-inspiring. Galaxies, stars, planets, and other celestial objects form intricate patterns. Galaxies group together in clusters and superclusters, connected by vast filaments of matter that create a "cosmic web." Between these structures lie enormous voids, vast spaces with little matter.

The universe is governed by the fundamental forces of nature: gravity, electromagnetism, and the strong and weak nuclear forces. These forces interact in complex ways to shape the behavior of matter and energy across cosmic scales.

Scientifically, studying the universe involves exploring its origins, evolution, and eventual fate. Cosmologists use tools like telescopes and particle accelerators to investigate phenomena ranging from the cosmic microwave background radiation—a faint glow left over from the Big Bang—to the nature of black holes and neutron stars.

Philosophically, the universe raises profound questions. Why does it exist? Is it infinite or finite? Are we alone in this vast expanse, or does life exist elsewhere? These inquiries have inspired human curiosity and imagination for millennia.

In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .supercluster:
"""
A supercluster is a massive collection of galaxies and galaxy clusters that are among the largest structures in the universe. These groupings are held together by gravity and can stretch across hundreds of millions of light-years.

Superclusters are made up of smaller galaxy clusters and groups that are loosely connected, forming a web-like pattern in space. This pattern is often referred to as the cosmic web, which includes large empty regions called voids, as well as dense areas where galaxies and clusters are concentrated.

For example, the Laniakea Supercluster is the supercluster that includes our galaxy, the Milky Way. It is about 520 million light-years wide. Another example is the Virgo Supercluster, which is smaller and contains the Virgo Cluster, a region rich in galaxies.

Superclusters show us the large-scale structure of the universe and help scientists understand how galaxies are distributed throughout space.
"""
        case .galaxyCluster:
"""
A galaxy cluster is a large group of galaxies held together by gravity. These structures are smaller than superclusters but are still among the largest formations in the universe. Galaxy clusters typically contain hundreds to thousands of galaxies within a region that can be millions of light-years across.

Galaxy clusters are made up of several key components. The most visible part is the galaxies themselves, which can include spiral galaxies, elliptical galaxies, and irregular galaxies. In addition to the galaxies, there is a large amount of very hot gas, called the intracluster medium, which fills the space between the galaxies. This gas is so hot that it emits X-rays. Most of the mass of a galaxy cluster, however, is made up of dark matter, an invisible form of matter that we can only detect through its gravitational effects.

Galaxy clusters often form where cosmic filaments intersect and represent dense regions of the universe. An example of a well-known galaxy cluster is the Virgo Cluster, which is part of the larger Laniakea Supercluster, the supercluster that also includes the Milky Way.
"""
        case .galaxy:
"""
A galaxy is a vast collection of stars, gas, dust, and dark matter, all bound together by gravity. Galaxies vary widely in size, with smaller ones containing millions of stars and larger ones holding trillions of stars. Our solar system, including Earth, is located within a galaxy called the Milky Way.

There are three main types of galaxies. Spiral galaxies have a flat, disk-like shape with curved arms spiraling out from a central bulge. The Milky Way and the Andromeda galaxy are examples of this type. Elliptical galaxies are more rounded or oval in shape and mostly contain older stars, with less gas and dust compared to spiral galaxies. Irregular galaxies have no specific shape and often look disorganized. These irregular shapes are sometimes caused by collisions or gravitational interactions with other galaxies.

Galaxies are not usually isolated. They are often found grouped together in galaxy clusters or larger structures like superclusters. Over time, galaxies can interact, merge, and evolve, driven by forces like gravity, star formation, and activity around black holes, which are typically located at their centers.
"""
        case .blackHole:
"""
A black hole is a region in space where gravity is so strong that nothing, not even light, can escape from it. This happens because a large amount of mass is packed into an extremely small space, creating an intense gravitational pull.

Black holes form in different ways. The most common type forms when a massive star runs out of fuel and collapses under its own gravity. These are called stellar black holes. There are also supermassive black holes, which are millions to billions of times more massive than the Sun. These are found at the centers of most galaxies, including our Milky Way.

The "boundary" of a black hole is called the event horizon. Once something crosses this boundary, it cannot escape. Inside the black hole, all the matter is compressed into a single point called the singularity, where the laws of physics as we know them break down.

Black holes can grow by pulling in nearby matter, including gas, dust, and even stars. As this matter spirals into the black hole, it heats up and emits X-rays, which can be detected by telescopes. Even though black holes are invisible, their effects on nearby objects, such as stars and gas, allow scientists to study them.
"""
        case .starCluster:
"""
A star cluster is a group of stars that are bound together by gravity and formed from the same giant cloud of gas and dust. These clusters are smaller than galaxies but important for understanding how stars are born and evolve.

There are two main types of star clusters. Open clusters are loose groups of stars, usually with a few dozen to a few thousand stars. They are often found in the arms of spiral galaxies and are made up of relatively young stars that are not tightly packed. Over time, open clusters tend to break apart as the stars move away from each other.

Globular clusters are much denser and more tightly packed. They can contain hundreds of thousands or even millions of stars, and their stars are much older than those in open clusters. Globular clusters have a spherical shape and are usually found in the outskirts of galaxies. They can be very old, sometimes containing some of the oldest stars in the universe.
"""
        case .solarSystem, .inSolarSystem:
"""
A solar system is a collection of celestial bodies, including a star and the objects bound to it by gravity. Our solar system, for example, consists of the Sun (our star) and all the planets, moons, asteroids, comets, and other objects that orbit it.

At the center of any solar system is a star, which provides the gravitational pull that keeps everything in orbit. In our solar system, the Sun is the central star, and it holds the planets and other objects in place with its strong gravitational force. The planets, including Earth, orbit the Sun, and each planet has its own system of moons (like how Earth has the Moon).

In addition to planets, a solar system may contain various other objects like asteroids (small rocky bodies), comets (icy bodies that travel in long orbits), and dwarf planets (like Pluto). The objects within a solar system are all influenced by the gravitational pull of the central star, and they orbit it in predictable paths, though the orbits of some objects, like comets, can be more eccentric or elongated.

Our solar system is just one of many solar systems in the Milky Way galaxy, which itself is part of the larger universe.
"""
        case .earth, .inEarth:
"""
Earth is the third planet from the Sun and the only known planet to support life. It has a unique set of characteristics that make it habitable, including its atmosphere, liquid water, and moderate temperature range.

The planet is composed of several layers: a solid inner core made mostly of iron and nickel, a liquid outer core, a semi-solid mantle, and the Earth's outer crust. The crust is where all living organisms reside, and it is covered by landmasses (continents) and oceans.

Earth has a diverse range of ecosystems and climates, from polar ice caps to tropical rainforests. It has a breathable atmosphere composed mostly of nitrogen (78%) and oxygen (21%), which supports life and protects the planet from harmful solar radiation.

Earth's rotation on its axis gives us day and night, and its orbit around the Sun, along with the tilt of its axis, creates the seasons. The planet is also home to a variety of species, including humans, and has a rich geological history marked by volcanic activity, earthquakes, and other natural events.

Earth is part of our solar system, orbiting the Sun in a nearly circular path at an average distance of about 93 million miles (150 million kilometers). It takes approximately 365.25 days for Earth to complete one orbit around the Sun, which defines the length of a year.
"""
        }
    }
}

final class Router: ObservableObject {
    @Published var currentDestination = Destination.inSolarSystem {
        willSet {
            previousLocation = currentDestination
        }
    }
    @Published var previousLocation: Destination?
}
