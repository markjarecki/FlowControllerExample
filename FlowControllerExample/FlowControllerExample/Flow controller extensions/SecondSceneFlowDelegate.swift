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

extension ApplicationFlowController: SecondSceneFlowDelegate {

    public func flow(tapFromSecondScene: SecondScene, content: Colours) -> Void {
    
        self.navigationController.popViewController(animated: false)
    
    }

}
