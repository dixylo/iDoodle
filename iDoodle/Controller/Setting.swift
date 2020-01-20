//
//  Setting.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 4/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// Used to specify the settings by returning the color and width for drawing
class Setting
{
    // Return the real color
    func selectColor(color: String, isTransparent: Bool) -> UIColor
    {
        if isTransparent
        {
            switch color // for tranparent colors
            {
            case "Black":
                return UIColor.transparentBlack
            case "Brown":
                return UIColor.transparentBrown
            case "Red":
                return UIColor.transparentRed
            case "Orange":
                return UIColor.transparentOrange
            case "Yellow":
                return UIColor.transparentYellow
            case "Green":
                return UIColor.transparentGreen
            case "Cyan":
                return UIColor.transparentCyan
            case "Blue":
                return UIColor.transparentBlue
            case "Purple":
                return UIColor.transparentPurple
            case "Magenta":
                return UIColor.transparentMagenta
            case "White":
                return UIColor.white
            default:
                return UIColor.transparentBlack
            }
        }
        else // for opaque colors
        {
            switch color
            {
            case "Black":
                return UIColor.black
            case "Brown":
                return UIColor.brown
            case "Red":
                return UIColor.red
            case "Orange":
                return UIColor.orange
            case "Yellow":
                return UIColor.yellow
            case "Green":
                return UIColor.green
            case "Cyan":
                return UIColor.cyan
            case "Blue":
                return UIColor.blue
            case "Purple":
                return UIColor.purple
            case "Magenta":
                return UIColor.magenta
            case "White":
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    }
    
    // Return the line width
    func selectLineWidth(width: String) -> CGFloat
    {
        switch width
        {
        case "1 pt":
            return 1
        case "2 pt":
            return 2
        case "3 pt":
            return 3
        case "4 pt":
            return 4
        case "5 pt":
            return 5
        case "6 pt":
            return 6
        case "7 pt":
            return 7
        case "8 pt":
            return 8
        case "9 pt":
            return 9
        case "10 pt":
            return 10
        default:
            return 5
        }
    }
}
