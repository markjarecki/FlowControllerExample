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
 
 Extension defines the ApplicationFlowController's handling of a flow intent notification from the HomeScene view module.
 
*/

extension ApplicationFlowController: HomeSceneFlowDelegate {

    // HomeScene tapped with content
    // Triggers pushing the SecondScene view module to the ApplicationFlowController's navigationController stack
    public func flow(tapFromHomeScene: HomeScene, content: Colours) -> Void {
    
        let secondScene = SecondScene(flowDelegate: self)

        self.navigationController.pushViewController(secondScene, animated: false)
        
    }

}
