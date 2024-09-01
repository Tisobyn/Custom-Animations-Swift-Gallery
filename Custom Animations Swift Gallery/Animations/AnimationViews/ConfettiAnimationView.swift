//
//  ConfettiAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ConfettiAnimationView: View {
    @State private var confetti = false

    var body: some View {
        ZStack {
            ForEach(0..<20, id: \.self) { index in
                Circle()
                    .fill(Color.random)
                    .frame(width: 10, height: 10)
                    .offset(x: confetti ? CGFloat.random(in: -150...150) : 0,
                            y: confetti ? CGFloat.random(in: -400...400) : 0)
                    .animation(.easeOut(duration: 2).repeatForever(autoreverses: false), value: confetti)
            }
        }
        .onAppear {
            confetti.toggle()
        }
        .padding()
        .navigationTitle("Confetti Animation")
    }
}

extension Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    ConfettiAnimationView()
}
