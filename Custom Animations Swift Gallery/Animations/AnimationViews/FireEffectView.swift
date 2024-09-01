//
//  FireEffectView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct FireEffectView: View {
    @State private var ignite = false

    var body: some View {
        ZStack {
            ForEach(0..<20, id: \.self) { _ in
                Circle()
                    .fill(Color.orange.opacity(0.8))
                    .frame(width: 5, height: 20)
                    .offset(x: ignite ? CGFloat.random(in: -30...30) : 0, y: ignite ? -100 : 0)
                    .scaleEffect(ignite ? 1 : 0.5)
                    .opacity(ignite ? 0 : 1)
                    .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: ignite)
            }
        }
        .frame(width: 100, height: 200)
        .onAppear {
            ignite.toggle()
        }
        .padding()
        .navigationTitle("Fire Effect")
    }
}

#Preview {
    FireEffectView()
}
