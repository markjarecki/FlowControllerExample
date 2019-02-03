//
//  SecondScene.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import BlueViewModuleFramework

final public class SecondScene: BlueViewController {
    
    // MARK: User interactors
    
    // User interactors encapsulated user interaction with the view controller
    // Triggers flows to the scene specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var edgeswipeUserInteractor: (UIPercentDrivenInteractiveTransition & UINavigationControllerDelegate)?

}
