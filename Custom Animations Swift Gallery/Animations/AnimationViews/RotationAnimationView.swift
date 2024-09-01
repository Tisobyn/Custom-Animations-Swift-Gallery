//
//  RotationAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct RotationAnimationView: View {
    @State private var isRotated = false

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.easeInOut(duration: 2), value: isRotated)
                .padding(.bottom)
            
            Button("Rotate") {
                isRotated.toggle()
            }
        }
        .padding()
        .navigationTitle("Rotation Animation")
    }
}

#Preview {
    RotationAnimationView()
}
