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
 
 Extension defines the ApplicationFlowController's handling of a flow intent notification from the SecondScene view module.
 
 */

extension ApplicationFlowController: SecondSceneFlowDelegate {

    // SecondScene tapped with content
    // Triggers popping the view module from the ApplicationFlowController's navigationController stack
    public func flow(tapFromSecondScene: SecondScene, content: Colours) -> Void {
    
        let transition = SOME Transition manager
        
        tapFromSecondScene.transitioningDelegate = transition
        
        self.navigationController.popViewController(animated: false)
    
    }

}
