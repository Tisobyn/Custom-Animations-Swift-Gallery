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
        ZStack {
            // Background overlay to collapse buttons when tapping outside
            if isExpanded {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded = false
                        }
                    }
            }

            // Main content
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    // Expandable buttons
                    VStack {
                        if isExpanded {
                            // Button 1
                            Button(action: {
                                // Action for the first button
                            }) {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .transition(.move(edge: .trailing).combined(with: .opacity))

                            // Button 2
                            Button(action: {
                                // Action for the second button
                            }) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                        }

                        // Main FAB button
                        Button(action: {
                            withAnimation(.spring()) {
                                isExpanded.toggle()
                            }
                        }) {
                            Image(systemName: isExpanded ? "xmark" : "ellipsis")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.green)
                                .clipShape(Circle())
                                .rotationEffect(.degrees(isExpanded ? 45 : 0))
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.trailing, 20) // Adjust padding as needed
                    .padding(.bottom, 20)
                }
            }
        }
        .animation(.spring(), value: isExpanded) // Apply spring animation to the entire ZStack
        .navigationTitle("Floating Button Animation")
    }
}



#Preview {
    FloatingButtonAnimationView()
}
