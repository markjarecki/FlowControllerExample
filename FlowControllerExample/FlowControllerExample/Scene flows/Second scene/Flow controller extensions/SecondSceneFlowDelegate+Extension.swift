//
//  SecondSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import SecondSceneFramework

/*
 
 Extension defines the ApplicationFlowController's flow delegate method for SecondScene.
 
*/
extension SecondSceneFlowDelegate where Self: FlowController {

    // SecondScene edgeSwiped with content
    // Triggers popping the view module from the ApplicationFlowController's navigationController stack
    func returnToHomeScene(fromScene scene: SecondScene) -> Void {
            
        // Assign as scene's edgeswipeFlowInteractor as the navigationController's transition delegate
        navigationController.delegate = scene.edgeswipeFlowInteractor as? UINavigationControllerDelegate
        
        // By design, we will be going back to the HomeScene, by popping the SecondScene from the stack
        navigationController.popViewController(animated: true)
        
    }

}
