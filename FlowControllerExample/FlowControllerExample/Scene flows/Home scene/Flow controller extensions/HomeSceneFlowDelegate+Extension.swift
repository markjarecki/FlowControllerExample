//
//  HomeSceneFlowDelegate.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Generic user interactors
import UserInteractors

// From scene
import HomeSceneFramework

// To scene
import SecondSceneFramework

/*
 
 Extension defines the ApplicationFlowController's handling of a flow trigger from the HomeScene view module.
 
*/

extension ApplicationFlowController: HomeSceneFlowDelegate {

    // HomeScene tapped with content
    // Triggers pushing the SecondScene view module to the ApplicationFlowController's navigationController stack
    public func flow(tapFromHomeScene scene: HomeScene, content: Colours) -> Void {
    
        // Build the `to` scene
        let secondScene = SecondScene()
        
        // Assign all `to` scene user interactors
        // One user interactor per flow
        secondScene.edgeswipeUserInteractor = SecondSceneToHomeSceneEdgeSwipeUserInteractor(viewController: secondScene, flowDelegate: self){ viewController, flowDelegate in
            
                guard let secondScene = viewController as? SecondScene else { return }
            
                flowDelegate.flow(edgeswipeFromSecondScene: secondScene, content: Colours(name: secondScene.view.backgroundColor!.description) )
            
            }
        
        navigationController.delegate = scene.tapUserInteractor
        
        // Add the `to` to the stack - with built-in animation
        navigationController.pushViewController(secondScene, animated: true)
        
    }

}
