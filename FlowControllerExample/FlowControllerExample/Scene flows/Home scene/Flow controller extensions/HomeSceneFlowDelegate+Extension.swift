//
//  HomeSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import SharedEntities

// From scene
import HomeSceneFramework

// To scene
import SecondSceneFramework

/*
 
 Extension defines the ApplicationFlowController's flow delegate method for HomeScene.
 
*/

extension HomeSceneFlowDelegate where Self: FlowController, Self: SecondSceneFlowDelegate {

    // HomeScene tapped with content
    // Triggers pushing the SecondScene view module to the ApplicationFlowController's navigationController stack
    func showSecondScene(fromScene: HomeScene, content: Colour) -> Void {
    
        // Build the `to` scene
        let secondScene = SecondScene()
        
        // Assign all `to` scene flow interactors
        secondScene.edgeswipeFlowInteractor = SecondSceneToHomeSceneEdgeSwipeFlowInteractor(viewController: secondScene, flowDelegate: self)
        
        secondScene.viewModel = content
        
        // Add the `to` to the stack - with built-in animation
        navigationController.delegate = nil
        
        navigationController.pushViewController(secondScene, animated: true)
        
    }

}
