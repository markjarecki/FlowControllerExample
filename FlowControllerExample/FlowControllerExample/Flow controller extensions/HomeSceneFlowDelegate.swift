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

extension ApplicationFlowController: HomeSceneFlowDelegate {

    public func flow(tapFromHomeScene: HomeScene, content: Colours) -> Void {
    
        let secondScene = SecondScene(flowDelegate: self)

        self.navigationController.pushViewController(secondScene, animated: false)
        
    }

}
