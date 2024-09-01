//
//  FlipCardShadowAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct FlipCardShadowAnimationView: View {
    @State private var isFlipped = false

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isFlipped ? Color.purple : Color.orange)
                    .frame(width: 200, height: 300)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .overlay(
                        Text(isFlipped ? "Back" : "Front")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.8)) {
                    isFlipped.toggle()
                }
            }
            
            Text("Tap to Flip")
                .padding()
        }
        .navigationTitle("Flip Card with Shadow")
    }
}


#Preview {
    FlipCardShadowAnimationView()
}
