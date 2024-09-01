//
//  SlideAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct SlideAnimationView: View {
    @State private var isSlid = false

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 100)
                .offset(x: isSlid ? 100 : -100)
                .animation(.easeInOut(duration: 1), value: isSlid)
            
            Button("Slide") {
                isSlid.toggle()
            }
        }
        .padding()
        .navigationTitle("Slide Animation")
    }
}


#Preview {
    SlideAnimationView()
}
