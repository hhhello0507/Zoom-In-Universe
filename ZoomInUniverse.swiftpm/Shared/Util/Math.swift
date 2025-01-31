import Foundation

func randomPointOnEllipsoid(a: Double, b: Double, c: Double) -> (x: Double, y: Double, z: Double) {
    let r = Double.random(in: 0...1).cbrt() // 반경 비율, 구 내부에서 균일 분포를 위해 세제곱근
    let theta = Double.random(in: 0...2 * .pi)
    let phi = acos(2 * Double.random(in: 0...1) - 1)
    
    let x = r * a * sin(phi) * cos(theta)
    let y = r * b * sin(phi) * sin(theta)
    let z = r * c * cos(phi)
    
    return (x, y, z)
}

extension Double {
    func cbrt() -> Double {
        self * self * self
    }
}
