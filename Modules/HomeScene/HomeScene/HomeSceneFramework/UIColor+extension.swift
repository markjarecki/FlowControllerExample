//
//  UIColor+extension.swift
//  HomeSceneFramework
//
//  Created by Mark Jarecki on 5/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

extension UIColor {
    
    var rgbComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            
            return (r,g,b,a)
            
        }
        
        return (0, 0, 0, 0)
        
    }
    
    var htmlRGBColor: String {
        
        return String(format: "#%02x%02x%02x",
                      Int(rgbComponents.red * 255),
                      Int(rgbComponents.green * 255),
                      Int(rgbComponents.blue * 255))
    
    }

}
