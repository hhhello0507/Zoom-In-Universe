import SwiftUI
import SceneKit

struct ScaleModeView: View {
    @Environment(\.dismiss) private var dismiss
//    @State private var viewModel = ScaleModeViewModel()
//    @State private var cameraPosZ: Float = 0
    @State private var audioPlayer = AudioPlayer()
    @State var scnView = SCNView()
    @State var selectedNode: SCNNode?
    @State var isSettingPresented = false
    
    var body: some View {
        ZStack {
            ScaleModeSceneView(
                scnView: scnView,
//                cameraPosZ: $cameraPosZ,
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
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            audioPlayer.playSound()
        }
        .navigationDestination(item: $selectedNode) { node in
//            let _ = print("selected node name - \(node.name)")
            let type: NodeType? = switch node.name {
            case "Earth": .earth
            case "Airplain": .airplain
            case "Human": .human
            case "Galaxy": .galaxy
            case "Black Hole": .blackHole
            case "Artificial Satellites": .artificialSatellites
            case "Aurora": .aurora
            case "Molecule": .molecule
            case "Star Cluster": .starCluster
            case "Solar System": .solarSystem
            case "Galaxy Cluster": .galaxyCluster
            case "Cloud": .cloud
            case "Ocean": .ocean
            case "Pyramid": .pyramid
            default: nil
            }
            if let type {
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
