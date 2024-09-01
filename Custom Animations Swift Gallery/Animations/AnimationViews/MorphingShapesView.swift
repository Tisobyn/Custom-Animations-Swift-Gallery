//
//  MorphingShapesView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct MorphingShapesView: View {
    @State private var morph = false

    var body: some View {
        MorphShape(morphValue: morph ? 1 : 0)
            .fill(morph ? Color.green : Color.orange)
            .frame(width: 100, height: 100)
            .animation(.easeInOut(duration: 1), value: morph)
            .onTapGesture {
                morph.toggle()
            }
            .padding()
            .navigationTitle("Morphing Shapes")
    }
}

struct MorphShape: Shape {
    var morphValue: CGFloat

    var animatableData: CGFloat {
        get { morphValue }
        set { morphValue = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height

        // Define control points for a rounded rectangle morphing into a circle
        let adjustedWidth = width * (1 - morphValue / 2) + height * (morphValue / 2)
        let adjustedHeight = height * (1 - morphValue / 2) + width * (morphValue / 2)

        let cornerRadius = min(adjustedWidth, adjustedHeight) * (morphValue / 2)

        path.addRoundedRect(
            in: CGRect(x: rect.midX - adjustedWidth / 2, y: rect.midY - adjustedHeight / 2, width: adjustedWidth, height: adjustedHeight),
            cornerSize: CGSize(width: cornerRadius, height: cornerRadius)
        )

        return path
    }
}


#Preview {
    MorphingShapesView()
}
