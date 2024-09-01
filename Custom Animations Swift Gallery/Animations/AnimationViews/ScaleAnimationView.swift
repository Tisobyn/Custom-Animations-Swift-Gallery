//
//  ScaleAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ScaleAnimationView: View {
    @State private var isScaled = false

    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
                .scaleEffect(isScaled ? 1.5 : 1)
                .animation(.easeInOut(duration: 1), value: isScaled)
                .padding(.bottom)
            
            Button("Tap to change Scale") {
                isScaled.toggle()
            }
        }
        .padding()
        .navigationTitle("Scale Animation")
    }
}

#Preview {
    ScaleAnimationView()
}
