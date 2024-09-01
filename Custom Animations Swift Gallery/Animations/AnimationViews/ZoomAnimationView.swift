//
//  ZoomAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ZoomAnimationView: View {
    @State private var isZoomed = false

    var body: some View {
        VStack {
            ZStack {
                Color.clear // Keeps the layout fixed
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 100, height: 100) // Set a base frame size
                    .scaleEffect(isZoomed ? 2 : 1) // Adjust scale to make it appear larger
                    .animation(.easeInOut(duration: 0.5), value: isZoomed)
                    .onTapGesture {
                        isZoomed.toggle()
                    }
            }
            .frame(width: 200, height: 200) // Fixed container frame to avoid pushing text
            .clipped() // Ensure content stays within the bounds

            Text("Tap to Zoom")
        }
        .padding()
        .navigationTitle("Zoom Animation")
    }
}



#Preview {
    ZoomAnimationView()
}
