//
//  SecondSceneTransitionManager.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import SharedEntities

final public class SecondSceneTransitionManager: UIPercentDrivenInteractiveTransition {
    
    // MARK: - Properties
    
    // MARK: Interactivity flag
    
    public var interactive = true
    
    // MARK: Animation properties
    
    public let animationDuration: TimeInterval = 1.0
    
    // MARK: Gesture recognizer
    
    private let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
    
    // MARK: View controller
    
    internal weak var sourceViewController: SecondScene! {
        
        didSet {
            
            // Set up gesture recognizer
            leftEdgeSwipeGesture.addTarget(self, action: #selector(handler(pan:)))
            leftEdgeSwipeGesture.edges = .left
            sourceViewController.view.addGestureRecognizer(leftEdgeSwipeGesture)
            
        }
        
    }
    
    // MARK: - Gesture handler
    
    @objc public func handler(pan: UIScreenEdgePanGestureRecognizer) {
        
        let translation = pan.translation(in: pan.view!)
        
        // Normalised distance travelled
        let distance = translation.x / pan.view!.bounds.width * 0.5
        
        switch (pan.state) {
            
            case .began:

                interactive = true
                
                // Start transition
                sourceViewController.flowDelegate.flow(tapFromSecondScene: sourceViewController, content: Colours(name: sourceViewController.view.backgroundColor!.description) )
            
            case .changed:
                
                update(distance)
            
            // .ended, .cancelled, .failed
            default:
                
                interactive = false
                
                if distance > 0.2 {
                    
                    // Threshold breached - finish transition
                    finish()
                    
                } else {
                    
                    // Threshold missed - cancel transition
                    cancel()
                }

        }
        
    }
    
}

// MARK: - UIViewControllerAnimatedTransitioning conformance

extension SecondSceneTransitionManager: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return animationDuration
        
    }
    
    public func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        
        return transitionDriver!.animator
        
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
    }
    
}

// MARK: - UIViewControllerTransitioningDelegate conformance

extension SecondSceneTransitionManager: UIViewControllerTransitioningDelegate {
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        // If interactive == true, return transition manager, otherwise nil
        
        return interactive ? self : nil
        
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactive ? self : nil
        
    }
    
}
