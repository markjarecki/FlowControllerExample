//
//  Flows.swift
//  Flows
//
//  Created by Mark Jarecki on 30/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

public protocol FirstSceneToSecondSceneFlow: class {

    associatedtype SenderType: UIViewController

    func flowFirstSceneToSecondScene(sender: SenderType)

}
