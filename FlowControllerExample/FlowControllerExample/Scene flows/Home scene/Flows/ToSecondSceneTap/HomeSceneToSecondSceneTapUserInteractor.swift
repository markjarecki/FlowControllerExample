//
//  HomeSceneToSecondSceneTapUserInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 3/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Scene interchange entities
import SharedEntities

// From scene
import HomeSceneFramework

class HomeSceneToSecondSceneTapUserInteractor: NSObject {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    let flowDelegate: HomeSceneFlowDelegate
    
    // MARK: Gesture recognizer
    
    private let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    init(viewController: UIViewController, flowDelegate: HomeSceneFlowDelegate) {
        
        self.viewController = viewController
        self.flowDelegate = flowDelegate
        
        super.init()
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        // Set up gesture recognizer
        tapGesture.addTarget(self, action: #selector(handler(tap:)))
        viewController.view.addGestureRecognizer(tapGesture)
        
    }
    
    // MARK: - Gesture handler
    
    @objc public func handler(tap: UITapGestureRecognizer) {
        
        guard let homeScene = viewController as? HomeScene else { return }
        
        if tap.state == .ended {
            
            flowDelegate.flow(tapFromHomeScene: homeScene, content: Colours(name: homeScene.view.backgroundColor!.description) )
            
        }
        
    }

}
