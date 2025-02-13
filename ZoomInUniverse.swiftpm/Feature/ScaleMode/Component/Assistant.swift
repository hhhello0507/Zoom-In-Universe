//
//  SwiftUIView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/13/25.
//

import SwiftUI

struct Assistant: View {
    @State private var index = 0
    @State private var displayedContent: [Character] = []
    @State private var timer: Timer?
    
    let content: String

    var body: some View {
        FlowLayout {
            ForEach(Array(displayedContent.enumerated()), id: \.0) { _, char in
                CharacterView(character: char)
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
        .onChange(of: content, initial: true) { _, newValue in
            displayedContent = []
            index = 0
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true) { timer in
                if index >= newValue.count {
                    timer.invalidate()
                    return
                }
                
                let newChar = newValue[newValue.index(newValue.startIndex, offsetBy: index)]
                
                DispatchQueue.main.async {
                    withAnimation(.easeIn(duration: 0.2)) {
                        displayedContent.append(newChar)
                    }
                    index += 1
                }
            }
        }
        .padding(15)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 6))
    }
}

struct CharacterView: View {
    let character: Character
    @State private var opacity = 0.0
    
    var body: some View {
        Text(String(character))
            .font(.system(size: 15))
            .opacity(opacity)
            .animation(.easeIn(duration: 0.5), value: opacity)
            .onAppear {
                withAnimation {
                    opacity = 1.0
                }
            }
    }
}

extension String {
    subscript(i: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: i)
        return String(self[index])
    }
}

struct FlowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let subSizes = subviews.map { $0.sizeThatFits(proposal) }

        let proposedWidth = proposal.width ?? .infinity
        var maxRowWidth = CGFloat.zero
        var rowCount = CGFloat.zero
        var x = CGFloat.zero
        for subSize in subSizes {
            // This prevents empty rows if any subviews are wider than proposedWidth.
            let lineBreakAllowed = x > 0

            if lineBreakAllowed, x + subSize.width > proposedWidth {
                rowCount += 1
                x = 0
            }

            x += subSize.width
            maxRowWidth = max(maxRowWidth, x)
        }

        if x > 0 {
            rowCount += 1
        }

        let rowHeight = subSizes.lazy.map { $0.height }.max() ?? 0
        return CGSize(
            width: proposal.width ?? maxRowWidth,
            height: rowCount * rowHeight
        )
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let subSizes = subviews.map { $0.sizeThatFits(proposal) }
        let rowHeight = subSizes.lazy.map { $0.height }.max() ?? 0
        let proposedWidth = proposal.width ?? .infinity

        var p = CGPoint.zero
        for (subview, subSize) in zip(subviews, subSizes) {
            // This prevents empty rows if any subviews are wider than proposedWidth.
            let lineBreakAllowed = p.x > 0

            if lineBreakAllowed, p.x + subSize.width > proposedWidth {
                p.x = 0
                p.y += rowHeight
            }

            subview.place(
                at: CGPoint(
                    x: bounds.origin.x + p.x,
                    y: bounds.origin.y + p.y + 0.5 * (rowHeight - subSize.height)
                ),
                proposal: proposal
            )

            p.x += subSize.width
        }
    }
}
