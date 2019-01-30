//
//  RedModuleViewController.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import Flows

public class RedViewController: UIViewController {
    
    // MARK: - Properties
    
    public let flowDelegate: MainFlows
    
    // MARK: - Gesture recognisers
    
    public let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    public init(flowDelegate: MainFlows) {
    
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // MARK: - View lifecycle overrides
    
    override public func viewDidLoad() {
    
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        // Set the gesture recognizer
        tapGesture.addTarget(self, action: #selector(handleTap(tap:)))
        view.addGestureRecognizer(tapGesture)
        
    }

    // MARK: - Gesture recogniser handlers
    
    @objc public func handleTap(tap: UITapGestureRecognizer) {
            
        _handleTap(tap: tap)
    
    }
    
}
