import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .launchScreen {
                        LaunchScreenView()
                    }
            }
            .preferredColorScheme(.dark)
        }
    }
}
