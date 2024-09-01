//
//  WaveAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct WaveAnimationView: View {
    @State private var wavePhase: CGFloat = 0

    var body: some View {
        ZStack {
            WaveShape(phase: wavePhase)
                .stroke(Color.blue, lineWidth: 2)
                .frame(height: 200)
                .onAppear {
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                        wavePhase = 360
                    }
                }
        }
        .padding()
        .navigationTitle("Wave Animation")
    }
}

struct WaveShape: Shape {
    var phase: CGFloat

    var animatableData: CGFloat {
        get { phase }
        set { phase = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midHeight = rect.height / 2
        let wavelength = rect.width / 2

        path.move(to: CGPoint(x: 0, y: midHeight))
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / wavelength
            let y = midHeight + 20 * sin(relativeX * 2 * .pi + phase * .pi / 180)
            path.addLine(to: CGPoint(x: x, y: y))
        }
        return path
    }
}
#Preview {
    WaveAnimationView()
}
