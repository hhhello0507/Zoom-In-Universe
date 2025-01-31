import UIKit

extension UIColor {
    convenience init(_ hexCode: UInt64, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexCode & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexCode & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexCode & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
