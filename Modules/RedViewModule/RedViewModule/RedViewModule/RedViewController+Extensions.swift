//
//  RedViewController+Extensions.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 30/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import Flows

extension RedViewController: RedViewControllerGesturesHandleable where FlowDelegateType == MockFlowDelegate {

    public func _handleTap(tap: UITapGestureRecognizer) {
        
        print("DUDE")
        
        if tap.state == .ended {
        
            self.flowDelegate?.flowFirstSceneToSecondScene(sender: self, content: Colours(name: "Green"))
        
        }
    
    }

}
