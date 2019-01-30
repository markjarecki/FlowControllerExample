//
//  MockFlowDelegate.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 30/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Flows

public class MockFlowDelegate: FirstSceneToSecondSceneFlow {

    public typealias SenderType = RedViewController
    
    public func flowFirstSceneToSecondScene(sender: RedViewController<MockFlowDelegate>, content: Colours) {
    
        print(sender)
        print(content)

    }

}
