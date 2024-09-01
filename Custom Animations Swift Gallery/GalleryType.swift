//
//  GalleryType.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import Foundation

enum GalleryType: String, CaseIterable, Identifiable, Hashable {
    case animation
    case transition
    
    var id: String { return self.rawValue }
    
    var title: String {
        switch self {
        case .animation:
            return "Animations"
        case .transition:
            return "Transitions"
        }
    }
}
