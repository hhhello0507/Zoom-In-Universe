import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
#if DEBUG
                ScaleModeView()
#else
                HomeView()
                    .launchScreen {
                        LaunchScreenView()
                    }
#endif
            }
            .preferredColorScheme(.dark)
        }
    }
}
