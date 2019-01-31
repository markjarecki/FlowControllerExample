//
//  Colours.swift
//  SharedEntities
//
//  Created by Mark Jarecki on 31/1/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct Colours {

    public let name: String

    public init(name: String){
        
        self.name = name
    
    }
}

extension Colours: Equatable {
    
    public static func ==(lhs: Colours, rhs: Colours) -> Bool {
        
        return lhs.name == rhs.name
        
    }
    
}
