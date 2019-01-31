//
//  HomeSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import HomeSceneFramework
import SharedEntities

extension ApplicationFlowController: HomeSceneFlowDelegate {

    public func flow(tapFromHomeScene: HomeScene, content: Colours) -> Void {
    
        print(content)
    
    }

}


