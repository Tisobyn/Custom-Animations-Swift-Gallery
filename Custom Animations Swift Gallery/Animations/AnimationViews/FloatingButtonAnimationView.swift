//
//  FloatingButtonAnimationView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct FloatingButtonAnimationView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()

                ZStack {
                    if isExpanded {
                        VStack {
                            Button(action: {}) {
                                Image(systemName: "pencil")
                                    .padding()
                                    .background(Color.red)
                                    .clipShape(Circle())
                            }

                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Circle())
                            }
                        }
                        .transition(.scale)
                    }

                    Button(action: {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(systemName: "ellipsis")
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                            .rotationEffect(.degrees(isExpanded ? 45 : 0))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Floating Button Animation")
    }
}


#Preview {
    FloatingButtonAnimationView()
}
