//
//  FlowController.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 30/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Flows

public class FlowController {
    
    public init() {}
    
}

extension FlowController: MainFlows {
    
    public func flowFirstSceneToSecondScene(sender: UIViewController, content: Colours) {
    
        print(sender)
        print(content)

    }

}
