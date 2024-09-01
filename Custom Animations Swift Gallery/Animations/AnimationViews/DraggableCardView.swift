//
//  DraggableCardView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct DraggableCardView: View {
    @State private var offset = CGSize.zero

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.purple)
            .frame(width: 200, height: 300)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
            .padding()
            .navigationTitle("Draggable Card Animation")
    }
}

#Preview {
    DraggableCardView()
}
