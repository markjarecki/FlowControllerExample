//
//  ApplicationNavigationController.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 2/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

class ApplicationNavigationController: UINavigationController {
    
    // MARK: - UIViewController lifecycle override
    
    override func viewDidLoad() {
        
        // Set view properties
        isToolbarHidden = true
        isNavigationBarHidden = true
        
    }
    
}
