// Github - https://github.com/hhhello0507/ScopeKit
// :)

import Foundation
#if !os(Linux)
import CoreGraphics
#endif
#if os(iOS) || os(tvOS)
import UIKit.UIGeometry
#endif

public protocol Scope {}

@inlinable
public func run<T>(
    block: () throws -> T
) rethrows -> T {
    return try block()
}

extension Scope where Self: Any {
    
    @inlinable
    public func with(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }
    
    @inlinable
    public func `let`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
    
    @discardableResult
    @inlinable
    public mutating func set<T>(
        _ keyPath: WritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
    
    @inlinable
    public mutating func mutate(_ block: (inout Self) throws -> Void) rethrows {
        try block(&self)
    }
    
    @inlinable
    public func `let`<T>(_ block: (Self) throws -> T) rethrows -> T {
        return try block(self)
    }
}

extension Scope where Self: AnyObject {
    
    @inlinable
    public func apply(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
    
    @discardableResult
    @inlinable
    public func set<T>(
        _ keyPath: ReferenceWritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}

extension NSObject: Scope {}

#if !os(Linux)
extension CGPoint: Scope {}
extension CGRect: Scope {}
extension CGSize: Scope {}
extension CGVector: Scope {}
#endif

extension Array: Scope {}
extension Dictionary: Scope {}
extension Set: Scope {}
extension JSONDecoder: Scope {}
extension JSONEncoder: Scope {}
extension Date: Scope {}
extension String: Scope {}
extension Int: Scope {}
extension Double: Scope {}
extension Float: Scope {}

#if os(iOS) || os(tvOS)
extension UIEdgeInsets: Scope {}
extension UIOffset: Scope {}
extension UIRectEdge: Scope {}
#endif
