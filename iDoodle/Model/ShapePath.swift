//
//  ShapePath.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 2/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// Paths generated on drawing a shape
class ShapePath: UIBezierPath
{
    // Path for drawing a straight line
    func line(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath {
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        return linePath
    }
    
    // Path for drawing an arc that is the lower half of a circle
    func arc(startPoint: CGPoint, translation: CGPoint) -> UIBezierPath {
        let radius = pow(pow(translation.x, 2) + pow(translation.y, 2), 0.5)
        return UIBezierPath(arcCenter: startPoint, radius: radius, startAngle: 0, endAngle: 3.14, clockwise: true)
    }
    
    // Path for drawing an ellipse
    func oval(startPoint: CGPoint, translation: CGPoint) -> UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: startPoint.x, y: startPoint.y, width:translation.x, height: translation.y))
    }
    
    // Path for drawing a rectangle with right-angled corners
    func rectangle(startPoint: CGPoint, translation: CGPoint) -> UIBezierPath {
        return UIBezierPath(rect: CGRect(x: startPoint.x, y: startPoint.y, width: translation.x, height: translation.y))
    }
    
    // Path for drawing a rectangle with rounded corners
    func roundedRect(startPoint: CGPoint, translation: CGPoint) -> UIBezierPath {
        return UIBezierPath(roundedRect: CGRect(x: startPoint.x, y: startPoint.y, width: abs(translation.x), height: abs(translation.y)), cornerRadius: 20)
    }
}
