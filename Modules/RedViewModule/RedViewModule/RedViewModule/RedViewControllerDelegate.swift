//
//  RedViewControllerDelegate.swift
//  RedViewModule
//
//  Created by Mark Jarecki on 29/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public protocol RedViewControllerDelegate: class {

    func didTap(_ sender: RedViewController, withContent content: String)

}
