//
//  SwiftUIView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/17/25.
//

import SwiftUI

extension View {
    func content<Content>(@ViewBuilder _ content: (Self) -> Content) -> Content where Content: View {
        content(self)
    }
}
