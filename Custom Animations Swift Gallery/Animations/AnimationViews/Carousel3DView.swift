//
//  Carousel3DView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct Carousel3DView: View {
    @State private var rotation: Double = 0

    var body: some View {
        ZStack {
            ForEach(0..<10) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.blue.opacity(0.7))
                    .rotation3DEffect(
                        .degrees(Double(index) * 36 - rotation),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .offset(x: 0, y: -50)
            }
        }
        .frame(width: 300, height: 300)
        .gesture(
            DragGesture()
                .onChanged { value in
                    rotation = value.translation.width
                }
                .onEnded { _ in
                    rotation = 0
                }
        )
        .navigationTitle("3D Carousel")
    }
}

#Preview {
    Carousel3DView()
}
