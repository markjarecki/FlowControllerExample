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
    
    public let flowDelegate: SecondSceneFlowDelegate
    
    // MARK: Flow interactors
    
    // Flow interactors trigger flows to the scene specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var edgeswipeFlowInteractor: (UIPercentDrivenInteractiveTransition & UINavigationControllerDelegate)?
    
    // MARK: - Initialisers
    
    public init(flowDelegate: SecondSceneFlowDelegate ) {
    
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

}
