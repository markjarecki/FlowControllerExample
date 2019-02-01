//
//  SecondSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import HomeSceneFramework
import SecondSceneFramework
import SharedEntities

/*
 
 Extension defines the ApplicationFlowController's handling of a flow outlet from the SecondScene view module.
 
 */

extension ApplicationFlowController: SecondSceneFlowDelegate {

    // SecondScene edgeSwiped with content
    // Triggers popping the view module from the ApplicationFlowController's navigationController stack
    public func flow(tapFromSecondScene scene: SecondScene, content: Colours) -> Void {
    
        // Assign the appropriate transition controller for the given flow outlet, to the navigationController's delegate
        navigationController.delegate = scene.edgeswipeFlowOutlet
        
        // By design, we will be going back to the HomeScene, by popping the SecondScene from the stack
        navigationController.popViewController(animated: true)
        
    }

}
