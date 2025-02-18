//
//  Sender.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 2/18/25.
//

struct Message: Identifiable {
    enum Sender {
        case assistant
        case user
    }

    let id: Int
    let sender: Sender
    let content: String
}
