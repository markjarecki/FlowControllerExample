//
//  LeftEdgeSwipeUserInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 4/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

/*

 LeftEdgeSwipeUserInteractor is generic user interactor.
 
 It registers an interactive left edge swipe gesture recogniser - binding to the view controller's root view. Its interactive transiton  has a percentage threshold of 0.5 - after which it will transition to the end.
 
 It takes a generic type property - usually a protocol that requires a method to trigger a flow on the flow controller.
 
 This method is called in a closure defined at initialisation.
 
*/

public class LeftEdgeSwipeUserInteractor<FlowDelegateType>: UIPercentDrivenInteractiveTransition {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    let flowDelegate: FlowDelegateType
    
    let flowClosure: (UIViewController, FlowDelegateType) -> Void
    
    // MARK: Interaction in progress flag
    
    fileprivate(set) var interactionInProgress = false
    
    // MARK: Gesture recognizer
    
    private let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
    
    // MARK: - Initialisers
    
    init(viewController: UIViewController, flowDelegate: FlowDelegateType, flowClosure: @escaping (UIViewController, FlowDelegateType) -> Void) {
        
        self.viewController = viewController
        self.flowDelegate = flowDelegate
        self.flowClosure = flowClosure
        
        super.init()
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        // Set up gesture recognizer
        leftEdgeSwipeGesture.addTarget(self, action: #selector(handler(pan:)))
        leftEdgeSwipeGesture.edges = .left
        viewController.view.addGestureRecognizer(leftEdgeSwipeGesture)
        
    }
    
    // MARK: - Gesture handler
    
    @objc private func handler(pan: UIScreenEdgePanGestureRecognizer) {
        
        let translation = pan.translation(in: pan.view!)
        
        // Distance travelled
        let distance = translation.x / pan.view!.bounds.width
        
        switch (pan.state) {
            
            case .began:
                
                interactionInProgress = true
                
                // Start transition
                // Call the flow outlet for this interaction event
                flowClosure(viewController, flowDelegate)
            
            case .changed:
                
                update(distance)
            
            case .cancelled:
                
                interactionInProgress = false
                
                cancel()
            
            case .ended:
                
                interactionInProgress = false
                
                if pan.velocity(in: pan.view).x > 300 {
                    
                    finish()
                    
                    return
                    
                }
                
                distance > 0.5 ? finish() : cancel()
            
            // .failed
            default: break
            
        }
        
    }
    
}

