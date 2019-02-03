//
//  HomeSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import HomeSceneFramework
import SecondSceneFramework
import SharedEntities

/*
 
 Extension defines the ApplicationFlowController's handling of a flow trigger from the HomeScene view module.
 
*/

extension ApplicationFlowController: HomeSceneFlowDelegate {

    // HomeScene tapped with content
    // Triggers pushing the SecondScene view module to the ApplicationFlowController's navigationController stack
    public func flow(tapFromHomeScene scene: HomeScene, content: Colours) -> Void {
    
        // Build the destination scene
        let secondScene = SecondScene()
        
        // Assign all destination scene user interactors
        // One user interactor per flow
        secondScene.edgeswipeUserInteractor = SecondSceneToHomeSceneEdgeSwipeUserInteractor(viewController: secondScene, flowDelegate: self)
        
        navigationController.delegate = scene.tapUserInteractor
        
        // Add the destination to the stack - with built-in animation
        navigationController.pushViewController(secondScene, animated: true)
        
    }

}
