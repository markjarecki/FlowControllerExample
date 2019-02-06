//
//  SecondSceneToHomeSceneEdgeSwipeFlowInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class SecondSceneToHomeSceneEdgeSwipeFlowInteractor: UIPercentDrivenInteractiveTransition {
    
    // MARK: - Properties
    
    public let viewController: UIViewController
    
    public let flowDelegate: SecondSceneFlowDelegate
    
    // MARK: Interaction in progress flag
    
    private(set) public var interactionInProgress = false
    
    // MARK: Gesture recognizer
    
    public let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
    
    // MARK: - Initialisers
    
    public init(viewController: UIViewController, flowDelegate: SecondSceneFlowDelegate) {
        
        self.viewController = viewController
        self.flowDelegate = flowDelegate
        
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
        
        guard let secondScene = viewController as? SecondScene else { return }
        
        let translation = pan.translation(in: pan.view!)
        
        // Distance travelled
        let distance = translation.x / pan.view!.bounds.width
        
        switch pan.state {
            
            case .began:
                
                interactionInProgress = true
                
                // Start the interactive transition
                // Call the flow outlet for this interaction event
                flowDelegate.returnToHomeScene(fromScene: secondScene)
            
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
