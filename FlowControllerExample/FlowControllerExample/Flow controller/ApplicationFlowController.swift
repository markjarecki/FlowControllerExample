//
//  ApplicationFlowController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Starting scene
import HomeSceneFramework

/*
 ApplicationFlowController manages a navigation controller.
 It manages the sequence(routing) of flow between view modules, and pushes and pops them from the navigation controller's stack.
 
 Conformance to FlowController enforces the dependency for this role.
 
 Initialisation sets the initial scene to display when the application loads.
 
 It is expected that the class is extended with conformance to various FlowDelegate protocols. These protocols are found in the 'imported' view module frameworks, and are the dependent interfaces for the a view module framework's flow delegate. These modules notify the flow controller of an intent to flow to next module.

 The sequence of these flows is generally defined in user story documentation.
 
*/

class ApplicationFlowController {

    // MARK: - Flow Controller conformance
    
    let navigationController: UINavigationController
    
    // MARK: - Initialisers
    
    init(navigationController: UINavigationController){
    
        self.navigationController = navigationController
        
        // Make HomeScene the navigationController's rootController
        let rootController = HomeScene()
        
        // Assign all root scene user interactors
        // One user interactor per flow
        rootController.tapUserInteractor = HomeSceneToSecondSceneTapUserInteractor(viewController: rootController, flowDelegate: self){ viewController, flowDelegate in
            
            guard let homeScene = viewController as? HomeScene else { return }
            
                flowDelegate.flow(tapFromHomeScene: homeScene, content: Colours(name: homeScene.view.backgroundColor!.description) )
            
            }
        
        navigationController.show(rootController, sender: nil)
            
    }
    
}

