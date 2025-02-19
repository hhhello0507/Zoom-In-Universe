import SwiftUI
import SceneKit

struct ScaleModeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var audioPlayer = AudioPlayer()
    @State var scnView = SCNView()
    @State var selectedNode: SCNNode?
    @State var isSettingPresented = false
    @State var messages: [Message] = [
        .init(
            id: 0,
            sender: .assistant,
            content: "Welcome to the Zoom in Universe. Experience the cosmos like never before! 🚀✨"
        )
    ]
    @State var qnaList: [Qna] = [
        .init(
            id: 0,
            question: "What happens inside a black hole?",
            answer: "Inside a black hole, gravity is so strong that nothing, not even light, can escape. Scientists believe that space and time behave differently inside the event horizon."
        ),
        .init(
            id: 1,
            question: "Where is our galaxy located?",
            answer: "The Milky Way is a barred spiral galaxy located in the Local Group of galaxies, part of the Virgo Supercluster in the vast universe."
        ),
        .init(
            id: 2,
            question: "Does the universe have an edge?",
            answer: "The universe is constantly expanding, and scientists are unsure if it has a definite edge. Some theories suggest it could be infinite or curve back on itself."
        ),
        .init(
            id: 3,
            question: "Can I witness the Big Bang?",
            answer: "While we can't directly see the Big Bang, scientists have detected cosmic microwave background radiation, which is a remnant of the universe’s birth 13.8 billion years ago."
        ),
        .init(
            id: 4,
            question: "When will the Sun disappear?",
            answer: "The Sun will eventually become a red giant in about 5 billion years, then shrink into a white dwarf over time."
        ),
        .init(
            id: 5,
            question: "What will happen to the universe in the future?",
            answer: "Scientists believe the universe will either keep expanding forever (Big Freeze), collapse back on itself (Big Crunch), or enter a new phase of existence (Big Bounce)."
        ),
        .init(
            id: 6,
            question: "What would happen if Earth had two suns?",
            answer: "Earth’s climate would be dramatically different, with extreme heat, longer days, and possibly no nighttime in some regions. Life as we know it might not exist!"
        ),
        .init(
            id: 7,
            question: "Is there a planet made entirely of diamonds?",
            answer: "Yes! Scientists believe that the exoplanet 55 Cancri e may have a carbon-rich core, possibly forming diamond layers under extreme pressure."
        ),
        .init(
            id: 8,
            question: "Could we ever live on Mars?",
            answer: "Scientists are developing technology to make Mars habitable, but the lack of oxygen, freezing temperatures, and radiation exposure make it extremely challenging."
        ),
        .init(
            id: 9,
            question: "What is the coldest place in the universe?",
            answer: "The Boomerang Nebula holds the record at -272°C, just one degree above absolute zero! Even space itself isn’t that cold."
        ),
        .init(
            id: 10,
            question: "Is time travel possible?",
            answer: "According to Einstein’s theory of relativity, time slows down near massive objects or at high speeds. Technically, astronauts on the ISS experience a tiny bit of time dilation!"
        ),
        .init(
            id: 11,
            question: "How small can we go?",
            answer: "If you zoom in far enough, you reach quarks—the fundamental building blocks of protons and neutrons. Beyond that? Scientists are still searching!"
        ),
        .init(
            id: 12,
            question: "If I shrink to the size of an atom, what would I see?",
            answer: "You would enter the quantum realm, where particles exist in multiple states at once, teleport, and behave in ways we don’t fully understand!"
        ),
        .init(
            id: 13,
            question: "Can we see atoms?",
            answer: "Not with the human eye, but advanced microscopes can detect and even manipulate individual atoms."
        ),
        .init(
            id: 14,
            question: "What did the universe look like before the Big Bang?",
            answer: "No one knows for sure! Some theories suggest a previous universe collapsed and gave birth to ours in a cycle called the Big Bounce."
        ),
        .init(
            id: 15,
            question: "Will time ever stop?",
            answer: "If the universe expands forever and loses all energy, time itself might eventually become meaningless in a distant future called the Heat Death."
        ),
        .init(
            id: 16,
            question: "Can I see what Earth looked like millions of years ago?",
            answer: "Yes! Light from distant galaxies takes millions of years to reach us, so when we look at the night sky, we’re literally looking back in time."
        ),
        .init(
            id: 17,
            question: "What if I fell into a black hole?",
            answer: "You’d experience spaghettification—where gravity stretches you into a thin strand—before being crushed at the singularity."
        ),
        .init(
            id: 18,
            question: "Can I hear sound in space?",
            answer: "Space is a vacuum, so sound can’t travel. However, NASA has converted space signals into eerie sound waves!"
        ),
        .init(
            id: 19,
            question: "What’s the strangest exoplanet ever discovered?",
            answer: "HD 189733 b is a planet where it rains molten glass sideways due to extreme winds!"
        ),
        .init(
            id: 20,
            question: "Are there more planets or stars in the universe?",
            answer: "Scientists estimate there are more planets than stars, meaning billions of worlds are still waiting to be discovered!"
        )
    ]
    .shuffled()
    
    var body: some View {
        ZStack {
            ScaleModeSceneView(
                scnView: scnView,
                selectedNode: $selectedNode
            )
            .ignoresSafeArea()
            VStack(spacing: 10) {
                IconButton(icon: "Home") {
                    dismiss()
                }
                IconButton(icon: "Setting") {
                    isSettingPresented = true
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(12)
            Assistant(
                messages: $messages,
                qnaList: $qnaList
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing, 32)
            .padding(.top, 8)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            audioPlayer.playSound()
        }
        .fullScreenCover(item: $selectedNode) { node in
            if let nodeName = node.name,
               let type = NodeType(rawValue: nodeName) {
                NormalDetailView(node: node, type: type)
            }
        }
        .sheet(isPresented: $isSettingPresented) {
            List {
                VStack(alignment: .leading) {
                    Text("Background Music")
                        .font(.headline)
                    Slider(
                        value: .init {
                            audioPlayer.volumn
                        } set: { newValue in
                            audioPlayer.volumn = newValue
                        },
                        in: 0.0...1.0
                    )
                }
            }
        }
        .handHelper(for: .zoomInOutHand)
    }
}
