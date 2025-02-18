//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/17/25.
//

extension String {
    subscript(i: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: i)
        return String(self[index])
    }
}
