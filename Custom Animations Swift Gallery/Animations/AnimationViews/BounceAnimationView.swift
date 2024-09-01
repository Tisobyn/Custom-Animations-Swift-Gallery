//
//  BounceAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct BounceAnimationView: View {
    @State private var bounce = false

    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
                .offset(y: bounce ? 0 : -200)
                .animation(.interpolatingSpring(stiffness: 50, damping: 1).repeatForever(autoreverses: true), value: bounce)
                .onAppear {
                    bounce.toggle()
                }            
        }
        .padding()
        .navigationTitle("Bounce Animation")
    }
}

#Preview {
    BounceAnimationView()
}
