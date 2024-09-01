//
//  AnimationsView.swift
//  Custom Animations Swift Gallery
//
//  Created by Yermek Sabyrzhan on 9/1/24.
//

import SwiftUI

struct AnimationsView: View {
    
    private var groupedAnimations: [DifficultyLevel: [Animations]] {
        Dictionary(grouping: Animations.allCases, by: { $0.difficulty })
    }
    
    var body: some View {
        List {
            ForEach(DifficultyLevel.allCases, id: \.id) { difficulty in
                if let animations = groupedAnimations[difficulty] {
                    Section(header: Text(difficulty.rawValue)) {
                        ForEach(animations, id: \.id) { item in
                            NavigationLink(value: item) {
                                Text(item.title)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Animations")
        .navigationDestination(for: Animations.self) { item in
            navigationDestination(item: item)
        }
    }
    
    @ViewBuilder
    private func navigationDestination(item: Animations) -> some View {
        switch item {
        case .fade: FadeAnimationView()
        case .bounce: BounceAnimationView()
        case .scale: ScaleAnimationView()
        case .rotate: RotationAnimationView()
        case .colorChange: ColorChangeAnimationView()
        case .slide: SlideAnimationView()
        case .pulsate: PulsatingAnimationView()
        case .cardFlip: CardFlipAnimationView()
        case .path: PathAnimationView()
        case .shake: ShakeAnimationView()
        case .ripple: RippleAnimationView()
        case .draggableCard: DraggableCardView()
        case .glow: GlowAnimationView()
        case .loadingSpinner: LoadingSpinnerView()
        case .confetti: ConfettiAnimationView()
        case .wave: WaveAnimationView()
        case .firework: FireworkAnimationView()
        case .blinking: BlinkingAnimationView()
        case .parallax: ParallaxAnimationView()
        case .zoom: ZoomAnimationView()
        case .floatingButton: FloatingButtonAnimationView()
        case .heartbeat: HeartbeatAnimationView()
        case .flipCardShadow: FlipCardShadowAnimationView()
        case .progressBar: ProgressBarAnimationView()
        case .particleExplosion: ParticleExplosionView()
        case .magneticAttraction: MagneticAttractionView()
        case .carousel3D: Carousel3DView()
        case .liquidSwipe: LiquidSwipeView()
        case .springChain: SpringChainView()
        case .morphingShapes: MorphingShapesView()
        }
    }
}
#Preview {
    AnimationsView()
}
