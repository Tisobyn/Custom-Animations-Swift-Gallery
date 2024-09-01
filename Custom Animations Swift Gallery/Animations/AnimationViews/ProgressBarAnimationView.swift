//
//  ProgressBarAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ProgressBarAnimationView: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        VStack {
            ProgressBar(progress: progress)
                .frame(width: 200, height: 20)
                .padding()
            
            Button("Start Progress") {
                withAnimation(.linear(duration: 3)) {
                    progress = 1.0
                }
            }
        }
        .navigationTitle("Progress Bar Animation")
    }
}

struct ProgressBar: View {
    var progress: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
                .frame(width: progress * 200)
        }
    }
}


#Preview {
    ProgressBarAnimationView()
}
