//
//  SecondSceneToHomeSceneEdgeSwipeAnimator.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

// Scene interchange entities
import SharedEntities

// Origin scene
import SecondSceneFramework

// Destination scene
import HomeSceneFramework

final class SecondSceneToHomeSceneEdgeSwipeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties

    // MARK: Duration
    
    fileprivate let animatorDuration: TimeInterval
    
    // MARK: Property animator
    
    fileprivate let animator: UIViewPropertyAnimator
    
    // MARK: - Initialiser

    override init() {
    
        animator = SecondSceneToHomeSceneEdgeSwipeAnimator.makeAnimator(duration: 1.0)

        animatorDuration = animator.duration
        
        super.init()
        
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning conformance
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {

        print("transitionDuration")

        return animatorDuration

    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        print("animateTransition")

        // References to: from and to views
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!

        // Add the active views to the container
        container.addSubview(toView)
        container.addSubview(fromView)

        // Add a simple fadeout animation
        animator.addAnimations{ [unowned self] in

            let internalAnimator = UIViewPropertyAnimator(duration: self.animator.duration, curve: .linear){

                fromView.alpha = 0

            }

            internalAnimator.startAnimation()

        }

//        // Animator must be paused for interactive transition
//        animator.pauseAnimation()

    }

}

// MARK: - UIViewPropertyAnimator factory

extension SecondSceneToHomeSceneEdgeSwipeAnimator {

    static func makeAnimator(duration: TimeInterval) -> UIViewPropertyAnimator {

        // Linear timing
        let timingCurve = UICubicTimingParameters(animationCurve: .linear)

        return UIViewPropertyAnimator(duration: duration, timingParameters: timingCurve)

    }

}
