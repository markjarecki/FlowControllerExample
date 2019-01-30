//
//  RedViewControllerGesturesHandleable.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 30/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol RedViewControllerGesturesHandleable: class {
    
    func _handleTap(tap: UITapGestureRecognizer)

}

extension RedViewControllerGesturesHandleable {

    public func _handleTap(tap: UITapGestureRecognizer) {
    
        print("FLOORSOME")
    
    }

}
