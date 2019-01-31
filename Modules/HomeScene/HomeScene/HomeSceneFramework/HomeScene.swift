//
//  HomeScene.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import RedViewModuleFramework
import SharedEntities

final public class HomeScene: RedViewController {

    // MARK: - Properties
    
    let flowDelegate: HomeSceneFlowDelegate 
    
    let tapGesture = UITapGestureRecognizer()
    
    // MARK: - Initialisers
    
    public init(flowDelegate: HomeSceneFlowDelegate) {
    
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - UIViewController lifecycle overrides

    override public func viewDidLoad() {

        super.viewDidLoad()
        
        // Set up gesture recognizer
        tapGesture.addTarget(self, action: #selector(handler(tap:)))
        view.addGestureRecognizer(tapGesture)
        

    }
    
    // MARK: - Gesture handler
    
    @objc public func handler(tap: UITapGestureRecognizer) {

        if tap.state == .ended {
        
            flowDelegate.flow(tapFromHomeScene: self, content: Colours(name: view.backgroundColor!.description) )
        
        }
        
    }
        
}
