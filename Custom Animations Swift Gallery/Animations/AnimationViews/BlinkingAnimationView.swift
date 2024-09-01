//
//  BlinkingAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct BlinkingAnimationView: View {
    @State private var isVisible = true

    var body: some View {
        Text("Blinking Text")
            .opacity(isVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isVisible)
            .onAppear {
                isVisible.toggle()
            }
            .padding()
            .navigationTitle("Blinking Animation")
    }
}


#Preview {
    BlinkingAnimationView()
}
