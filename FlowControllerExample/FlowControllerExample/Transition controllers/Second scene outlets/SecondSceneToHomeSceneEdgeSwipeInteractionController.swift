//
//  SecondSceneToHomeSceneEdgeSwipeInteractionController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

// Scene interchange entities
import SharedEntities

//// Transition controller protocol definition
//import FlowControllerCore

// Origin scene
import SecondSceneFramework

// Destination scene
import HomeSceneFramework

final class SecondSceneToHomeSceneEdgeSwipeInteractionController: UIPercentDrivenInteractiveTransition {
    
    // MARK: - Properties
    
    // MARK: TransitionController conformance
    
    weak var viewController: UIViewController?
    
    // MARK: Interactivity flag
    
    fileprivate var interactive = false
    
    // MARK: Duration
    
    fileprivate let animatorDuration: TimeInterval
    
    // MARK: Gesture recognizer
    
    private let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
    
    // MARK: Property animator
    
    fileprivate let animator: UIViewPropertyAnimator
    
    // MARK: - Initialisers
    
    init(viewController: UIViewController) {
    
        self.viewController = viewController

        animator = SecondSceneToHomeSceneEdgeSwipeInteractionController.makeAnimator(duration: 1.0)

        animatorDuration = animator.duration
        
        super.init()
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        // Set up gesture recognizer
        leftEdgeSwipeGesture.addTarget(self, action: #selector(handler(pan:)))
        leftEdgeSwipeGesture.edges = .left
        viewController!.view.addGestureRecognizer(leftEdgeSwipeGesture)
    
    }
    
    // MARK: - Gesture handler
    
    @objc private func handler(pan: UIScreenEdgePanGestureRecognizer) {
    
        guard let secondScene = viewController as? SecondScene else { return }
        
        let translation = pan.translation(in: pan.view!)
        
        // Distance travelled
        let distance = translation.x / pan.view!.bounds.width * 0.5
        
        switch (pan.state) {
            
            case .began:

                interactive = true
                
                // Start transition
                // Call the flow outlet for this interaction event
                secondScene.flowDelegate.flow(tapFromSecondScene: secondScene, content: Colours(name: secondScene.view.backgroundColor!.description) )
            
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

// MARK: - Extension

extension SecondSceneToHomeSceneEdgeSwipeInteractionController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        return nil
    
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    
        return nil

    }

}


// MARK: - UIViewPropertyAnimator factory

extension SecondSceneToHomeSceneEdgeSwipeInteractionController {

    static func makeAnimator(duration: TimeInterval) -> UIViewPropertyAnimator {

        // Linear timing
        let timingCurve = UICubicTimingParameters(animationCurve: .linear)

        return UIViewPropertyAnimator(duration: duration, timingParameters: timingCurve)

    }

}
