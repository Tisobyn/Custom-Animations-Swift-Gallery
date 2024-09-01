//
//  SpringChainView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct SpringChainView: View {
    @State private var dragOffset = CGSize.zero
    private let itemCount = 5

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<itemCount, id: \.self) { index in
                Circle()
                    .frame(width: 20, height: 20)
                    .offset(x: dragOffset.width * CGFloat(index) / CGFloat(itemCount),
                            y: dragOffset.height * CGFloat(index) / CGFloat(itemCount))
                    .animation(.interpolatingSpring(stiffness: 50, damping: 5), value: dragOffset)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    dragOffset = gesture.translation
                }
                .onEnded { _ in
                    dragOffset = .zero
                }
        )
        .padding()
        .navigationTitle("Spring Chain")
    }
}


#Preview {
    SpringChainView()
}
