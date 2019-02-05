//
//  Colour.swift
//  SharedEntities
//
//  Created by Mark Jarecki on 5/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public struct Colour {
    
    public let name: String
    
    public init(name: String){
        
        self.name = name
        
    }
    
}

extension Colour: Equatable {
    
    public static func ==(lhs: Colour, rhs: Colour) -> Bool {
        
        return lhs.name == rhs.name
        
    }
    
}
