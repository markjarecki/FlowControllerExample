//
//  SecondSceneToHomeSceneEdgeSwipeNavigationDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// From scene
import SecondSceneFramework

// To scene
import HomeSceneFramework

extension SecondSceneToHomeSceneEdgeSwipeUserInteractor: UINavigationControllerDelegate {
    
    // MARK: - UINavigationControllerDelegate conformance

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            
        // Ensure transition conditions are correct
        guard operation == .pop,
            fromVC is SecondScene,
            toVC is HomeScene else { return nil }
                
        return SecondSceneToHomeSceneEdgeSwipeAnimator(interactor: self)
    
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    
        // Ensure interaction has been triggered by the interactor
        guard interactionInProgress == true else { return nil }
                
        return self

    }

}
