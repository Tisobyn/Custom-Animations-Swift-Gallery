//
//  ContentView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    private var sections: [GalleryType] = GalleryType.allCases
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(sections, id: \.id) { item in
                    NavigationLink(value: item, label: {
                        Text(item.title)
                    })
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: GalleryType.self) { destination in
                switch destination {
                case .animation:  AnimationsView()
                case .transition: Text("Transition")
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
