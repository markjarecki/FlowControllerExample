//
//  TapUserInteractor.swift
//  FlowControllerExample
//
//  Created by Mark Jarecki on 4/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public class TapUserInteractor<FlowDelegateType>: NSObject {
    
    // MARK: - Properties
    
    let viewController: UIViewController
    
    let flowDelegate: FlowDelegateType
    
    let flowClosure: (UIViewController, FlowDelegateType) -> Void
    
    // MARK: Gesture recognizer
    
    private let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    init(viewController: UIViewController, flowDelegate: FlowDelegateType, flowClosure: @escaping (UIViewController, FlowDelegateType) -> Void) {
        
        self.viewController = viewController
        self.flowDelegate = flowDelegate
        self.flowClosure = flowClosure

        super.init()
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        // Set up gesture recognizer
        tapGesture.addTarget(self, action: #selector(handler(tap:)))
        viewController.view.addGestureRecognizer(tapGesture)
        
    }
    
    // MARK: - Gesture handler
    
    @objc public func handler(tap: UITapGestureRecognizer) {
        
        if tap.state == .ended {
            
            flowClosure(viewController, flowDelegate)
            
        }
        
    }
    
    
}
