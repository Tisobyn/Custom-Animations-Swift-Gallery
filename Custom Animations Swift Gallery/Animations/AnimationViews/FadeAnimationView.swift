//
//  Simple Animations.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

// Example of a Fade Animation View
struct FadeAnimationView: View {
    @State private var isVisible = false

    var body: some View {
        VStack {
            Text("Fade Animation")
                .opacity(isVisible ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: isVisible)
                .padding(.bottom)
            
            Button(isVisible ? "Fade out" : "Fade in") {
                isVisible.toggle()
            }
        }
        .padding()
        .navigationTitle("Fade Animation")
    }
}




