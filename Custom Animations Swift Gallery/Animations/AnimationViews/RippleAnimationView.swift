//
//  RippleAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct RippleAnimationView: View {
    @State private var ripple = false

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .scaleEffect(ripple ? 3 : 1)
                .opacity(ripple ? 0 : 1)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: ripple)
                .onAppear {
                    ripple.toggle()
                }
        }
        .frame(width: 50, height: 50)
        .navigationTitle("Ripple Animation")
    }
}

#Preview {
    RippleAnimationView()
}
