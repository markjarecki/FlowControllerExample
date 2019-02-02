//
//  SecondSceneToHomeSceneEdgeSwipeInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

// Scene interchange entities
import SharedEntities

// From scene
import SecondSceneFramework

// To scene
import HomeSceneFramework

final class SecondSceneToHomeSceneEdgeSwipeInteractor: UIPercentDrivenInteractiveTransition {
    
    // MARK: - Properties
    
    // MARK: TransitionController conformance
    
    let viewController: UIViewController
    
    // MARK: Interaction in progress flag
    
    fileprivate(set) var interactionInProgress = false
    
    // MARK: Gesture recognizer
    
    private let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()

    // MARK: - Initialisers
    
    init(viewController: UIViewController) {
            
        self.viewController = viewController
        
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
        
        switch (pan.state) {
            
            case .began:

                interactionInProgress = true
                
                // Start transition
                // Call the flow outlet for this interaction event
                secondScene.flowDelegate.flow(edgeswipeFromSecondScene: secondScene, content: Colours(name: secondScene.view.backgroundColor!.description) )
            
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
