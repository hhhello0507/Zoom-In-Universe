//
//  File.swift
//  ZoomInUniverse
//
//  Created by hhhello0507 on 11/11/24.
//

import SwiftUI

struct Title: View {
    
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundStyle(.white)
            .bold()
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
