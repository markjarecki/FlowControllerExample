//
//  HomeSceneFlowDelegate.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import SharedEntities

public protocol HomeSceneFlowDelegate: class {

    func showSecondScene(fromScene: HomeScene, content: Colour) -> Void

}
