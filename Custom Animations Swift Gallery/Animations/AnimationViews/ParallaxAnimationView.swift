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
        GeometryReader { geometry in
            ZStack {
                // Background Layer - Farther away
                Image("background") // Replace with your image asset name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: offset.width / 20, y: offset.height / 20)
                    .ignoresSafeArea()

                // Middle Layer - Closer
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.gray)
                    .offset(x: offset.width / 10, y: offset.height / 10)
                    .opacity(0.8)

                // Foreground Layer - Closest
                VStack {
                    Text("Parallax Effect")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .offset(x: offset.width / 5, y: offset.height / 5)

                    Text("Drag to move")
                        .foregroundColor(.gray)
                        .offset(x: offset.width / 5, y: offset.height / 5)
                }
            }
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
        }
        .navigationTitle("Parallax Animation")
    }
}



#Preview {
    ParallaxAnimationView()
}
