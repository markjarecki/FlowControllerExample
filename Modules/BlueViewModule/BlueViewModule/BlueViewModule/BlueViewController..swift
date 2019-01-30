//
//  BlueViewController.swift
//  BlueViewModule
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

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
        
        view.backgroundColor = .blue
        
    }
    
}

