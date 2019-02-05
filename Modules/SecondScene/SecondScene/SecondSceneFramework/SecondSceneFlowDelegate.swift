//
//  SecondSceneFlowDelegate.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol SecondSceneFlowDelegate: class {

    func returnToHomeScene(fromScene: SecondScene) -> Void

}
