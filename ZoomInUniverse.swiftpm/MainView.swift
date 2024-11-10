import SwiftUI
import SceneKit

struct MainView: View {
    @StateObject private var model = SceneModel()
    @State private var scnView = SCNView()
    
    var body: some View {
        ZStack {
            SceneKitView(model: model, scnView: scnView)
                .ignoresSafeArea()
                .onChange(of: model.previousZoomLevel) {
                    print("Changed at \($0)")
                }
            if model.clickedNode != nil {
                Button {
                    model.clickedNode = nil
                    if model.clickedNode == nil {
                        scnView.pointOfView?.position = SceneKitViewCoordinator.cameraDefaultPosition
                        scnView.pointOfView?.rotation = .init()
                    }
                } label: {
                    Text("Exit")
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
    }
}
