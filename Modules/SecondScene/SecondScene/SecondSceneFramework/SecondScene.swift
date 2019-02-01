//
//  SecondScene.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import BlueViewModuleFramework

final public class SecondScene: BlueViewController {
    
    // MARK: - Properties
    
    let flowDelegate: SecondSceneFlowDelegate
    
    // INJECT THIS DEPENDENCY
    // TransitionControllerProtocol
    // Have UIViewController as a requirement
    // 
    public var transitionManager: //SecondSceneTransitionManager()
    
    // MARK: - Initialisers
    
    public init(flowDelegate: SecondSceneFlowDelegate ) {
    
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - UIViewController lifecycle overrides

    override public func viewDidLoad() {

        super.viewDidLoad()
        
        // Set the transition manager's source view controller
        transitionManager.sourceViewController = self
        
    }

}
