//
//  ApplicationFlowController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FlowControllerCore
import HomeSceneFramework

class ApplicationFlowController: FlowController {

    // MARK: - Flow Controller conformance
    
    let navigationController: UINavigationController
    
    // MARK: - Initialisers
    
    init(navigationController: UINavigationController){
    
        self.navigationController = navigationController
        
        let rootController = HomeScene()
        
        navigationController.show(rootController, sender: nil)
    
    }
    
}

