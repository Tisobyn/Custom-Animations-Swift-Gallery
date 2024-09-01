//
//  MagneticAttractionView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct MagneticAttractionView: View {
    @State private var attract = false
    private let positions = Array(repeating: CGPoint.zero, count: 10).enumerated().map {
        CGPoint(x: CGFloat($0.offset * 30), y: CGFloat($0.offset * 20))
    }

    var body: some View {
        ZStack {
            ForEach(positions.indices, id: \.self) { index in
                Circle()
                    .fill(Color.red)
                    .frame(width: 20, height: 20)
                    .offset(x: attract ? 0 : positions[index].x,
                            y: attract ? 0 : positions[index].y)
                    .animation(.easeInOut(duration: 1), value: attract)
            }
        }
        .frame(width: 200, height: 200)
        .onTapGesture {
            attract.toggle()
        }
        .padding()
        .navigationTitle("Magnetic Attraction")
    }
}


#Preview {
    MagneticAttractionView()
}
