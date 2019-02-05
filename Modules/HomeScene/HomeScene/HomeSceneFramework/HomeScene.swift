//
//  HomeScene.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class HomeScene: UIViewController {
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
    }

    // MARK: Flow interactors
    
    // Flow interactors encapsulated a view controller's user interaction which trigger a flow specified in the flow controller
    // This flow's transition can be a jump cut (no animation), animated, or interactive, depending on the implementation given by the flow controller
    public var tapFlowInteractor: NSObjectProtocol?

}
