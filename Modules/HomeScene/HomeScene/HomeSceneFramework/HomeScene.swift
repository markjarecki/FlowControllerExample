//
//  HomeScene.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import RedViewModuleFramework

final public class HomeScene: RedViewController {

    // MARK: User interactors
    
    // User interactors encapsulated user interaction with the view controller
    // Triggers flows to the scene specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or intberactive, depending on the implementation given by the flow controller
    public var tapUserInteractor: UINavigationControllerDelegate?

}
