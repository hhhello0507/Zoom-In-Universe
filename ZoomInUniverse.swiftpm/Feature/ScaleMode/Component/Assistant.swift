//
//  SwiftUIView.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/13/25.
//

import SwiftUI

struct Assistant: View {
    @Binding var messages: [Message]
    @Binding var qnaList: [Qna]
    @State var isPlaying: Bool? = false // nil: loading
    @State var nextMessage: Message? = Message(
        id: 1,
        sender: .assistant,
        content: "Embark on a journey across galaxies, navigate through nebulae, and uncover the mysteries of black holes.The adventure begins now – are you ready to reach for the stars? 🌌🔭"
    )
    @State var scrollViewProxy: ScrollViewProxy?
    @State var size: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Assistant")
                .font(.title2)
                .bold()
                .shadow(color: .black.opacity(0.2), radius: 4)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 16) {
                CustomScrollView(
                    scrollViewProxy: $scrollViewProxy,
                    reversed: true
                ) {
                    VStack(spacing: 8) {
                        ForEach(messages) { message in
                            MessageView(isPlaying: $isPlaying, message: message)
                                .content { view in
                                    switch message.sender {
                                    case .assistant:
                                        view
                                            .frame(maxWidth: 300)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    case .user:
                                        view
                                            .frame(maxWidth: 300)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                        }
                        if isPlaying == nil {
                            LoadingView()
                                .padding(15)
                                .background(.ultraThinMaterial, in: .rect(bottomLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .frame(maxHeight: 250)
                if isPlaying == false {
                    VStack(spacing: 4) {
                        ForEach(Array(qnaList[0..<3].enumerated()), id: \.element.id) { index, qna in
                            QuestionButton(content: qna.question) {
                                qnaList = qnaList.shuffled()
                                
                                messages.append(
                                    .init(
                                        id: messages.max { $0.id < $1.id }!.id + 1,
                                        sender: .user,
                                        content: qna.question
                                    )
                                )
                                
                                nextMessage = .init(
                                    id: messages.max { $0.id < $1.id }!.id + 1,
                                    sender: .assistant,
                                    content: qna.answer
                                )
                            }
                            .fadeInEffect(delay: 1 + Double(index) * 0.2, initialOffsetY: 10)
                        }
                    }
//                    .background {
//                        GeometryReader { proxy in
//                            Color.clear.onAppear {
//                                self.size = proxy.size
//                            }
//                        }
//                    }
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    //                .offset(y: size.height + 16) // 16: gap
                }
            }
        }
        .frame(width: 400)
        .onChange(of: isPlaying) { _, newValue in
            guard let nextMessage, isPlaying == false else { return }
            self.nextMessage = nil
            self.isPlaying = nil
            
            Task {
                try await Task.sleep(for: .seconds(2))
                messages.append(nextMessage)
            }
        }
    }
}

private struct QuestionButton: View {
    let content: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(content)
                .foregroundStyle(.black)
                .font(.system(size: 15))
                .frame(height: 36)
                .padding(.horizontal, 12)
                .background(.white, in: .rect(topLeadingRadius: 6, bottomLeadingRadius: 6, bottomTrailingRadius: 6))
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
