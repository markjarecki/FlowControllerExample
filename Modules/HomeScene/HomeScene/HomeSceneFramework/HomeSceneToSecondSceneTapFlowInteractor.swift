//
//  HomeSceneToSecondSceneTapFlowInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 3/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import SharedEntities

public class HomeSceneToSecondSceneTapFlowInteractor: NSObject {
    
    // MARK: - Properties
    
    public let viewController: UIViewController
    
    public let flowDelegate: HomeSceneFlowDelegate
    
    // MARK: Gesture recognizer
    
    public let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    public init(viewController: UIViewController, flowDelegate: HomeSceneFlowDelegate) {
        
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
    
    @objc private func handler(tap: UITapGestureRecognizer) {
        
        if tap.state == .ended {
            
            guard let homeScene = viewController as? HomeScene else { return }
            
            flowDelegate.showSecondScene(fromScene: homeScene, content: Colour(name: homeScene.view.backgroundColor!.description)) 
            
        }
        
    }
    
}
