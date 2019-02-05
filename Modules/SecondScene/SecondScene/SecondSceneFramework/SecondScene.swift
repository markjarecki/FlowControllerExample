//
//  SecondScene.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import SharedEntities

open class SecondScene: UIViewController {
    
    // MARK: - View Model
    
    var viewModel: Colour?
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
    }
    
    // MARK: Flow interactors
    
    // Flow interactors encapsulated a view controller's user interaction which trigger a flow specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var edgeswipeFlowInteractor: UIViewControllerInteractiveTransitioning?

}
