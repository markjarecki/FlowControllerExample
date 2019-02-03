//
//  SecondSceneToHomeSceneEdgeSwipeAnimator.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Scene interchange entities
import SharedEntities

// Origin scene
import SecondSceneFramework

// Destination scene
import HomeSceneFramework

final class SecondSceneToHomeSceneEdgeSwipeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties

    // MARK: Duration
    
    private let animatorDuration: TimeInterval = 0.5
    
    // MARK: Interactor
    
    weak var interactor: UIViewControllerInteractiveTransitioning?
    
    // MARK: - Initialiser

    init(interactor: UIViewControllerInteractiveTransitioning) {
    
        self.interactor = interactor
        
        super.init()
        
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning conformance
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {

        return animatorDuration

    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        // References to: from and to views
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!

        // Add the active views to the container
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // Animation properties
        let animations: (() -> Void) = {
            
            fromView.alpha = 0
            
        }
        
        let completion: ((Bool) -> Void) = { _ in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
        }
        
        // Linear animation
        // Do no use UIViewPropertyAnimator
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: [.allowUserInteraction, .curveLinear],
                       animations: animations,
                       completion: completion)
        
    }

}
