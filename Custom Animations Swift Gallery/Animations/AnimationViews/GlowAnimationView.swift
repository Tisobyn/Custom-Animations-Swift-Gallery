//
//  GlowAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct GlowAnimationView: View {
    @State private var glow = false

    var body: some View {
        Text("Glow Effect")
            .font(.largeTitle)
            .padding()
            .background(glow ? Color.blue : Color.gray)
            .cornerRadius(10)
            .shadow(color: glow ? .blue : .clear, radius: glow ? 20 : 0)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: glow)
            .onAppear {
                glow.toggle()
            }
            .navigationTitle("Glow Animation")
    }
}

#Preview {
    GlowAnimationView()
}
