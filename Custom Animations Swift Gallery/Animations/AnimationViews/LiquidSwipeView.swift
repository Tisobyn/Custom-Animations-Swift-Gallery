//
//  LiquidSwipeView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct LiquidSwipeView: View {
    @State private var swipeOffset: CGFloat = 0
    @State private var isSwiped = false

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            if isSwiped {
                Color.red
                    .ignoresSafeArea()
                    .offset(x: swipeOffset)
            }

            Text("Swipe Me")
                .font(.largeTitle)
                .foregroundColor(.white)
                .offset(x: swipeOffset / 2)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            swipeOffset = gesture.translation.width
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                isSwiped = swipeOffset > 100
                                swipeOffset = 0
                            }
                        }
                )
        }
        .navigationTitle("Liquid Swipe")
    }
}


#Preview {
    LiquidSwipeView()
}
