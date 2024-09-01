//
//  ParticleExplosionView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ParticleExplosionView: View {
    @State private var explode = false
    @State private var tapLocation: CGPoint = .zero

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .contentShape(Rectangle()) // Makes the entire screen tappable
                .onTapGesture { location in
                    tapLocation = location
                    startExplosion()
                }

            ForEach(0..<20, id: \.self) { _ in
                Circle()
                    .fill(Color.random)
                    .frame(width: 5, height: 5)
                    .position(tapLocation)
                    .offset(x: explode ? CGFloat.random(in: -150...150) : 0,
                            y: explode ? CGFloat.random(in: -150...150) : 0)
                    .opacity(explode ? 0 : 1)
                    .animation(.easeOut(duration: 1), value: explode)
            }
        }
        .navigationTitle("Particle Explosion")
    }

    private func startExplosion() {
        explode = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            explode = false
        }
    }
}


#Preview {
    ParticleExplosionView()
}
