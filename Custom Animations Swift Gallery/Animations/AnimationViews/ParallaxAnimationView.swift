//
//  ParallaxAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ParallaxAnimationView: View {
    @State private var offset = CGSize.zero

    var body: some View {
        ZStack {
            Image("background") // Replace with your image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(x: offset.width / 10, y: offset.height / 10)
                .ignoresSafeArea()

            VStack {
                Text("Parallax Effect")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                withAnimation(.easeOut) {
                                    offset = .zero
                                }
                            }
                    )
            }
        }
        .navigationTitle("Parallax Animation")
    }
}


#Preview {
    ParallaxAnimationView()
}
