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

In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .galaxyCluster:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .galaxy:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .blackHole:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .starCluster:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .solarSystem:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .inSolarSystem:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
"""
        case .earth:
"""
It's the earth.
"""
        case .inEarth:
"""
In summary, the universe is a vast, dynamic, and mysterious expanse that encompasses all existence. It operates through intricate laws and forces, shaping everything from the tiniest particles to the grandest galaxies. Understanding it is a journey that combines science, philosophy, and wonder.
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
