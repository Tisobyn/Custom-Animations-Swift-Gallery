//
//  Carousel3DView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct Carousel3DView: View {
    @State private var rotationAngle: Double = 0.0
    private let items = Array(0..<8) // Example items, replace with your own data

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            // 3D Carousel
            ZStack {
                ForEach(items.indices, id: \.self) { index in
                    CarouselItemView(index: index, totalItems: items.count, rotation: rotationAngle)
                        .rotation3DEffect(
                            .degrees(Double(index) * -360 / Double(items.count) + rotationAngle),
                            axis: (x: 0, y: 1, z: 0),
                            perspective: 0.7
                        )
                        .offset(x: 0, y: 0)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        rotationAngle = Double(value.translation.width / 5) // Adjust sensitivity
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            // Snap to nearest item after drag ends
                            rotationAngle = round(rotationAngle / 45) * 45
                        }
                    }
            )
        }
        .navigationTitle("3D Carousel")
    }
}

struct CarouselItemView: View {
    let index: Int
    let totalItems: Int
    let rotation: Double

    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(Color.blue.opacity(0.5))
                .clipShape(Circle())
                .shadow(radius: 5)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                )

            Text("Item \(index + 1)")
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: 150) // Ensures items have the correct spacing
    }

    private var isCenterItem: Bool {
        // Determine if the item is centered based on the current rotation
        let currentRotation = (rotation + 360).truncatingRemainder(dividingBy: 360)
        let targetRotation = Double(index) * -360 / Double(totalItems)
        return abs(currentRotation - targetRotation) < 22.5
    }
}



#Preview {
    Carousel3DView()
}
