//
//  FireworkAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct FireworkAnimationView: View {
    @State private var explode = false

    var body: some View {
        ZStack {
            ForEach(0..<20, id: \.self) { index in
                Circle()
                    .fill(Color.random)
                    .frame(width: 5, height: 5)
                    .offset(x: explode ? CGFloat.random(in: -150...150) : 0,
                            y: explode ? CGFloat.random(in: -150...150) : 0)
                    .opacity(explode ? 0 : 1)
                    .animation(.easeOut(duration: 1), value: explode)
            }
        }
        .onAppear {
            explode = true
        }
        .padding()
        .navigationTitle("Firework Animation")
    }
}


#Preview {
    FireworkAnimationView()
}
