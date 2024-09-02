//
//  MagneticAttractionView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct MagneticAttractionView: View {
    @State private var particles: [Particle] = []
    @State private var attractorPosition: CGPoint = .zero

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .onTapGesture { location in
                    attractorPosition = location
                    attractParticles()
                }

            // Display particles
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: 8, height: 8)
                    .position(particle.position)
                    .animation(.easeOut(duration: 1), value: particle.position)
            }
        }
        .onAppear {
            createParticles()
        }
        .navigationTitle("Magnetic Attraction")
    }

    // Create particles scattered randomly across the screen
    private func createParticles() {
        particles = (0..<50).map { _ in
            Particle(
                id: UUID(),
                position: CGPoint(
                    x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                    y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                ),
                color: Color.random
            )
        }
    }

    // Attract particles to the tapped position
    private func attractParticles() {
        for index in particles.indices {
            withAnimation {
                particles[index].position = attractorPosition
            }
        }
    }
}

struct Particle: Identifiable {
    let id: UUID
    var position: CGPoint
    var color: Color
}

#Preview {
    MagneticAttractionView()
}
