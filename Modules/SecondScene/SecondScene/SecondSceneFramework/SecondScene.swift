//
//  SecondScene.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import BlueViewModuleFramework
import FlowControllerCore

final public class SecondScene: BlueViewController {
    
    // MARK: - Properties
    
    let flowDelegate: SecondSceneFlowDelegate
    
    // MARK: Flow outlets
    
    // This flow outlet is triggers a transition to the scene specified in the flow controller
    // This transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given at the application level
    public var edgeswipeFlowOutlet: TransitionController?
    
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
        
        // Set the TransitionController's source view controller
        edgeswipeFlowOutlet?.sourceViewController = self
        
    }

}
