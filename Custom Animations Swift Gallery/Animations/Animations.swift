//
//  Animations.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

enum DifficultyLevel: String, Identifiable, CaseIterable {
    case simple = "Simple"
    case medium = "Medium"
    case hard = "Hard"
    case hardcore = "Hardcore"

    var id: String { self.rawValue }
}

enum Animations: String, Identifiable, CaseIterable, Hashable {
    case fade, bounce, scale, rotate, colorChange, slide, pulsate, cardFlip, path
    case shake, ripple, draggableCard, glow, loadingSpinner, confetti, wave, firework
    case blinking, parallax, zoom, floatingButton, heartbeat, flipCardShadow, progressBar
    case particleExplosion, magneticAttraction, carousel3D, liquidSwipe, springChain, morphingShapes

    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .fade: return "Fade Animation"
        case .bounce: return "Bounce Animation"
        case .scale: return "Scale Animation"
        case .rotate: return "Rotation Animation"
        case .colorChange: return "Color Change Animation"
        case .slide: return "Slide Animation"
        case .pulsate: return "Pulsating Animation"
        case .cardFlip: return "Card Flip Animation"
        case .path: return "Path Animation"
        case .shake: return "Shake Animation"
        case .ripple: return "Ripple Animation"
        case .draggableCard: return "Draggable Card Animation"
        case .glow: return "Glow Animation"
        case .loadingSpinner: return "Loading Spinner Animation"
        case .confetti: return "Confetti Animation"
        case .wave: return "Wave Animation"
        case .firework: return "Firework Animation"
        case .blinking: return "Blinking Animation"
        case .parallax: return "Parallax Animation"
        case .zoom: return "Zoom Animation"
        case .floatingButton: return "Floating Button Animation"
        case .heartbeat: return "Heartbeat Animation"
        case .flipCardShadow: return "Flip Card with Shadow Animation"
        case .progressBar: return "Progress Bar Animation"
        case .particleExplosion: return "Particle Explosion Animation"
        case .magneticAttraction: return "Magnetic Attraction Animation"
        case .carousel3D: return "3D Carousel Animation"
        case .liquidSwipe: return "Liquid Swipe Animation"
        case .springChain: return "Dynamic Spring Chain Animation"
        case .morphingShapes: return "Morphing Shapes Animation"
        }
    }
    
    // Assign a difficulty level to each animation
    var difficulty: DifficultyLevel {
        switch self {
        case .fade, .scale, .rotate, .colorChange, .slide, .pulsate, .blinking, .progressBar, .bounce, .shake, .ripple, .draggableCard, .zoom, .heartbeat, .flipCardShadow, .cardFlip:
            return .simple
        case .particleExplosion, .morphingShapes: 
            return .medium
        case .path, .glow, .loadingSpinner, .confetti, .floatingButton, .parallax:
            return .hard
        case .wave, .firework:
            return .hardcore
        case .magneticAttraction, .carousel3D: return .hard
        case .liquidSwipe, .springChain: return .hardcore
        }
    }
}
