import SwiftUI
import SceneKit

struct ScaleModeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var audioPlayer = AudioPlayer()
    @State var scnView = SCNView()
    @State var selectedNode: SCNNode?
    @State var isSettingPresented = false
    
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
                content: "Welcome to a universe at your fingertips, zoom in, and experience the cosmos like never before! 🚀✨ Embark on a journey across galaxies, navigate through nebulae, and uncover the mysteries of black holes. Every star tells a story, every planet holds secrets waiting to be discovered. Get ready to unlock the vast wonders of space, all from the comfort of your own world. The adventure begins now – are you ready to reach for the stars? 🌌🔭"
            )
            .frame(maxWidth: 400)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 32)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            audioPlayer.playSound()
        }
        .navigationDestination(item: $selectedNode) { node in
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
#if !DEBUG
        .handHelper(for: .zoomInOutHand)
#endif
    }
}
