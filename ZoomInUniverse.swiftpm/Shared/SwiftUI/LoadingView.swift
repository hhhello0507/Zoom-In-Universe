//
//  LoadingView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/18/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var loadingState: Int = -1
    
    public var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { idx in
                let opacity = loadingState == idx ? 1 : 0.1
                Circle()
                    .foregroundStyle(.white)
                    .opacity(opacity)
                    .frame(width: 8, height: 8)
            }
        }
        .onChange(of: loadingState) { _, newValue in
            Task {
                try await Task.sleep(for: .seconds(0.3))
                withAnimation(.spring(duration: 0.5)) {
                    loadingState = (newValue + 1) % 3
                }
            }
        }
        .onAppear {
            loadingState = 0
        }
    }
}
