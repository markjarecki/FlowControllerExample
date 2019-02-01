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
                secondScene.flowDelegate.flow(edgeswipeFromSecondScene: secondScene, content: Colours(name: secondScene.view.backgroundColor!.description) )
            
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
