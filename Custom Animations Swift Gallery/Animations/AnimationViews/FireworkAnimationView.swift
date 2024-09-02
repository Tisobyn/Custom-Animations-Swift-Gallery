//
//  FireworkAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct FireworkAnimationView: View {
    @State private var particles: [FireworkParticle] = []
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .onTapGesture { location in
                    createFirework(at: location)
                }

            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: 5, height: 5)
                    .position(particle.startPosition)
                    .offset(particle.offset)
                    .opacity(particle.opacity)
                    .animation(.easeOut(duration: 1), value: particle.offset)
            }
        }
        .navigationTitle("Firework Animation")
    }

    private func createFirework(at location: CGPoint) {
        let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink, .cyan]
        
        // Create 30 particles with random directions and colors
        let newParticles = (0..<30).map { _ in
            FireworkParticle(
                id: UUID(),
                startPosition: location,
                offset: CGSize(
                    width: CGFloat.random(in: -150...150),
                    height: CGFloat.random(in: -150...150)
                ),
                color: colors.randomElement() ?? .white,
                opacity: 1.0
            )
        }
        
        // Add new particles to the list and start the animation
        particles.append(contentsOf: newParticles)
        
        // Trigger animation changes after a slight delay to allow SwiftUI to render particles
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                for index in particles.indices {
                    particles[index].offset = CGSize(
                        width: particles[index].offset.width * 2,
                        height: particles[index].offset.height * 2
                    )
                    particles[index].opacity = 0
                }
            }
        }
        
        // Clean up particles after animation finishes
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            particles.removeAll()
        }
    }
}

struct FireworkParticle: Identifiable {
    let id: UUID
    var startPosition: CGPoint
    var offset: CGSize
    var color: Color
    var opacity: Double
}




#Preview {
    FireworkAnimationView()
}
