//
//  PathAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

import SwiftUI

struct PathAnimationView: View {
    @State private var position: CGPoint = CGPoint(x: 100, y: 100) // Starting position of the circle

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .contentShape(Rectangle()) // Makes the entire screen tappable
                .onTapGesture { location in
                    moveTo(location)
                }

            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .position(position)
            
            Text("Tap to any position")
        }
        .navigationTitle("Path Animation")
    }

    private func moveTo(_ location: CGPoint) {
        withAnimation(.easeInOut(duration: 1)) {
            position = location
        }
    }
}

#Preview {
    PathAnimationView()
}
