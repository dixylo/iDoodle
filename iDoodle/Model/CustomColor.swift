//
//  CustomColor.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 2/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// Create an extension for customized colors
extension UIColor
{
    class var transparentBlack : UIColor
    {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    class var transparentBrown : UIColor
    {
        return UIColor(red: 170/255, green: 127/255, blue: 65/255, alpha: 0.3)
    }
    
    class var transparentRed: UIColor
    {
        return UIColor (red: 255/255, green: 0, blue: 0, alpha: 0.3)
    }
    
    class var transparentOrange: UIColor
    {
        return UIColor (red: 255/255, green: 127/255, blue: 0, alpha: 0.3)
    }
    
    class var transparentYellow: UIColor
    {
        return UIColor (red: 255/255, green: 255/255, blue: 0, alpha: 0.3)
    }
    
    class var transparentGreen : UIColor
    {
        return UIColor(red: 0, green: 255/255, blue: 0, alpha: 0.3)
    }
    
    class var transparentCyan: UIColor
    {
        return UIColor (red: 0, green: 255/255, blue: 255/255, alpha: 0.3)
    }
    
    class var transparentBlue : UIColor
    {
        return UIColor(red: 0, green: 0, blue: 255/255, alpha: 0.3)
    }
    
    class var transparentMagenta: UIColor
    {
        return UIColor (red: 255/255, green: 0, blue: 255/255, alpha: 0.3)
    }
    
    class var transparentPurple: UIColor
    {
        return UIColor (red: 127/255, green: 0, blue: 127/255, alpha: 0.3)
    }
    
    class var veryDarkGreen: UIColor
    {
        return UIColor.rgb(fromHex: 0x008110)
    }
    
    class func rgb(fromHex: Int) -> UIColor
    {
        
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
