//
//  HeartbeatAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct HeartbeatAnimationView: View {
    @State private var isBeating = false

    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .scaleEffect(isBeating ? 1.2 : 1) // Scale effect simulating heartbeat
                .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isBeating)
                .onAppear {
                    isBeating = true // Start the heartbeat animation
                }
                .padding()
        }
        .frame(width: 150, height: 150) // Fixed frame to avoid shifting
        .navigationTitle("Heartbeat Animation")
    }
}



#Preview {
    HeartbeatAnimationView()
}
