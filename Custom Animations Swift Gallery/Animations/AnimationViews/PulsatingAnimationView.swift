//
//  PulsatingAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct PulsatingAnimationView: View {
    @State private var pulsate = false

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .scaleEffect(pulsate ? 1.2 : 1)
                .opacity(pulsate ? 0.5 : 1)
                .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: pulsate)
                .onAppear {
                    pulsate.toggle()
                }
        }
        .frame(width: 200, height: 200) // Ensures the ZStack itself is centered
        .navigationTitle("Pulsating Animation")
    }
}

#Preview {
    PulsatingAnimationView()
}
