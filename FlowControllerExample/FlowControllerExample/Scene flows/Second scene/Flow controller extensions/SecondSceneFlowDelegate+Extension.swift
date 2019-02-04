//
//  SecondSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Generic user interactors
import UserInteractors

// Scene
import SecondSceneFramework

/*
 
 Extension defines the ApplicationFlowController's flow delegate method for SecondScene.
 
 */

extension ApplicationFlowController: SecondSceneFlowDelegate {

    // SecondScene edgeSwiped with content
    // Triggers popping the view module from the ApplicationFlowController's navigationController stack
    public func flow(edgeswipeFromSecondScene scene: SecondScene, content: Colours) -> Void {
            
        // Assign as scene's edgeswipeUserInteractor as the navigationController's transition delegate
        navigationController.delegate = scene.edgeswipeUserInteractor
        
        // By design, we will be going back to the HomeScene, by popping the SecondScene from the stack
        navigationController.popViewController(animated: true)
        
    }

}
