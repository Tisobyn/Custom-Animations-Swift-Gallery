//
//  LoadingSpinnerView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct LoadingSpinnerView: View {
    @State private var isSpinning = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(isSpinning ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isSpinning)
            .onAppear {
                isSpinning = true
            }
            .padding()
            .navigationTitle("Loading Spinner Animation")
    }
}


#Preview {
    LoadingSpinnerView()
}
