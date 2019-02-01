//
//  SecondSceneToHomeSceneEdgeSwipeNavigationDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

final class SecondSceneToHomeSceneEdgeSwipeNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    // MARK: - UINavigationControllerDelegate conformance

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        return nil
    
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    
        return nil

    }

}
