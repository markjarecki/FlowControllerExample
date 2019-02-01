//
//  TransitionController.swift
//  FlowControllerCore
//
//  Created by Mark Jarecki on 1/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol TransitionController: UIViewControllerTransitioningDelegate {

    var sourceViewController: UIViewController? { get set }

}
