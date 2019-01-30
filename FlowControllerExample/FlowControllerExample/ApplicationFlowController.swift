//
//  ApplicationFlowController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FlowControllerCore
import RedViewModuleFramework

class ApplicationFlowController: FlowController {

    // MARK: - Flow Controller conformance
    
    let navigationController: UINavigationController
    
    // MARK: - Initialisers
    
    init(navigationController: UINavigationController){
    
        self.navigationController = navigationController
        
        let rootController = RedViewController<ApplicationFlowController>()
        
        rootController.flowDelegate = self
        
        navigationController.show(rootController, sender: nil)
    
    }
    
}

