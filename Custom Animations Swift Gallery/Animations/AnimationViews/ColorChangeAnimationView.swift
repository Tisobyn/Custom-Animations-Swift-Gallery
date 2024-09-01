//
//  ColorChangeAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ColorChangeAnimationView: View {
    @State private var isColorChanged = false

    var body: some View {
        VStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(isColorChanged ? .red : .blue)
                .animation(.easeInOut(duration: 1), value: isColorChanged)
            
            Button("Change Color") {
                isColorChanged.toggle()
            }
        }
        .padding()
        .navigationTitle("Color Change Animation")
    }
}

#Preview {
    ColorChangeAnimationView()
}
