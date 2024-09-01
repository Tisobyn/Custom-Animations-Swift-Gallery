//
//  ShakeAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ShakeAnimationView: View {
    @State private var shake = false

    var body: some View {
        Button(action: {
            shake.toggle()
        }) {
            Text("Shake Me!")
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
                .offset(x: shake ? -10 : 10) // Increase the offset for a more noticeable shake
                .animation(.easeInOut(duration: 0.1).repeatCount(5, autoreverses: true), value: shake) // Adjusted duration for faster shaking
        }
        .padding()
        .navigationTitle("Shake Animation")
    }
}

#Preview {
    ShakeAnimationView()
}
