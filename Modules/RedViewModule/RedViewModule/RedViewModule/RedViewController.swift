//
//  RedModuleViewController.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit
import Flows

public class RedViewController<FlowDelegateType: FirstSceneToSecondSceneFlow>: UIViewController {
    
    // MARK: - Properties
    
    public var flowDelegate: FlowDelegateType?
    
    // MARK: - Gesture recognisers
    
    public let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    
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
    
        print("AWESOME")
        
        _handleTap(tap: tap)
    
    }
    
}

extension RedViewController: RedViewControllerGesturesHandleable {}
