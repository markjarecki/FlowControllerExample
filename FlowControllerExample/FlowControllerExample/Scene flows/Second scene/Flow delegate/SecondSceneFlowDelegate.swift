//
//  SecondSceneFlowDelegate.swift
//  SecondSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import SecondSceneFramework

public protocol SecondSceneFlowDelegate: class {

    func flow(edgeswipeFromSecondScene: SecondScene, content: Colours) -> Void

}
