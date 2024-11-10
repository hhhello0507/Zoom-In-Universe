import UIKit

enum UIApplicationUtil {
    static var scenes: Set<UIScene> {
        return UIApplication.shared.connectedScenes
    }
    
    static var windowScene: UIWindowScene? {
        return Self.scenes.compactMap({ $0 as? UIWindowScene }).first
    }
    
    static var window: UIWindow? {
        return Self.windowScene?.windows.first
    }
    
    static var rootViewController: UIViewController? {
        return Self.window?.rootViewController
    }
}
