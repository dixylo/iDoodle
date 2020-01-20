//
//  CanvasView.swift
//  DrawTest
//
//  Created by Xiaofeng Lin on 2/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// View as the canvas
class CanvasView: UIView {
    
    var lineColor: UIColor = UIColor.black // Color to draw in
    var lineWidth: CGFloat = 5 // Width of the line to draw
    var startPoint: CGPoint = CGPoint.zero // Starting point where a drawing begins
    var endPoint: CGPoint = CGPoint.zero // Ending point where a drawing finishes
    var translation: CGPoint = CGPoint.zero // Distance between the starting and the ending points
    var path: UIBezierPath? // Drawing path
    var canvasLayer: CAShapeLayer? // Layer on which a stroke is
    
    var colorLabel: String = "Black" // Label of a color, which the user gets from a selection
    var shapeIndex = Shape.doodle // Index of a shape to draw
    
    var isErasing = false // Check the erasing function is on
    var shapeUsed = Shape.doodle // A temparory variable for restoring the shape selected after erasing is off
    
// Outlets
    // Color
    @IBOutlet weak var colorOutlet: UIButton!
    @IBOutlet var colorItemOutlets: [UIButton]!
    
    // Shape
    @IBOutlet weak var shapeOutlet: UIButton!
    @IBOutlet var shapeItemOutlets: [UIButton]!
    
    // Line Width
    @IBOutlet weak var lineWidthOutlet: UIButton!
    @IBOutlet var lineWidthItemOutlets: [UIButton]!
    
    // Switch
    @IBOutlet weak var `switch`: UISwitch!
    
    // Eraser
    @IBOutlet weak var eraser: UIButton!
    
// Actions
    // Color
    @IBAction func colorAction(_ sender: UIButton) {
        colorItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // expands or collapses the palette
        }
        
        // Hide other settings when selecting
        shapeItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        lineWidthItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        
        // Turn the erasing off when selecting
        if isErasing {
            isErasing = false
            eraser.backgroundColor = UIColor.clear
            lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn)
            shapeIndex = shapeUsed
        }
    }
    @IBAction func colorItemActions(_ sender: UIButton) {
        colorLabel = (sender.titleLabel?.text)! // gets the color label
        lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn) // gets the color
        colorOutlet.backgroundColor = sender.backgroundColor // sets the background of the palette button to the color selected
        colorItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // hides the palette after selecting
        }
    }
    
    // Shape
    @IBAction func shapeAction(_ sender: UIButton) {
        shapeItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // expands or collapses the shape pool
        }
        
        // Hide other settings when selecting
        colorItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        lineWidthItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        
        // Turn the erasing off when selecting
        if isErasing {
            isErasing = false
            eraser.backgroundColor = UIColor.clear
            lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn)
            shapeIndex = shapeUsed
        }
    }
    @IBAction func shapeItemActions(_ sender: UIButton) {
        shapeIndex = Shape(rawValue: sender.tag)! // gets the shape index
        shapeUsed = shapeIndex // stores the shape index temparorily for restoring after erasing
        shapeOutlet.setImage(sender.currentImage, for: UIControlState.normal) // sets the shape button to the shape selected
        shapeItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // hides the shape pool after selecting
        }
    }
    
    // Line Width
    @IBAction func lineWidthAction(_ sender: UIButton) {
        lineWidthItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // expands or collapses the line width set
        }
        
        // Hide other settings when selecting
        colorItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        shapeItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        
        // Turn the erasing off when selecting
        if isErasing {
            isErasing = false
            eraser.backgroundColor = UIColor.clear
            lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn)
            shapeIndex = shapeUsed
        }
    }
    @IBAction func lineWidthItemActions(_ sender: UIButton) {
        lineWidth = Setting().selectLineWidth(width: (sender.titleLabel?.text)!) // gets the line width
        lineWidthItemOutlets.forEach { (item) in
            item.isHidden = !item.isHidden // hides the line width set after selecting
        }
    }
    
    // Erase
    @IBAction func erase(_ sender: UIButton) {
        isErasing = !isErasing // toggles the function between on and off
        if isErasing {
            sender.backgroundColor = UIColor.black // shows highlight when on
            lineColor = Setting().selectColor(color: "White", isTransparent: false) // mandatory white for eraser
            shapeIndex = Shape.doodle // mandatory free style for eraser
        }
        else {
            sender.backgroundColor = UIColor.clear // de-highlight
            lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn) // restores the color for drawing
            shapeIndex = shapeUsed // restores the shape to draw
        }
        
        // Collapse other all the other settings when the focus is on erasing
        colorItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        shapeItemOutlets.forEach { (item) in
            item.isHidden = true
        }
        lineWidthItemOutlets.forEach { (item) in
            item.isHidden = true
        }
    }
    
    // Switch between transparent and opaque colors
    @IBAction func `switch`(_ sender: UISwitch) {
        let alert: UIAlertController!
        if sender.isOn == true {
            alert = UIAlertController(title: "Color Mode Changed!", message: "All colors are now TRANSPARENT!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        else {
            alert = UIAlertController(title: "Color Mode Changed!", message: "All colors are now OPAQUE!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        // Tell the user that color mode has been changed
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        
        // Turn off erasing and restore settings
        if isErasing {
            isErasing = false
            eraser.backgroundColor = UIColor.clear
            lineColor = Setting().selectColor(color: colorLabel, isTransparent: `switch`.isOn)
            shapeIndex = shapeUsed
        }
        
        // reset the color with the mode selected
        lineColor = Setting().selectColor(color: colorLabel, isTransparent: sender.isOn)
    }
    
    override func layoutSubviews() {
        self.clipsToBounds = true // prevents drawing outside the canvas
        self.isMultipleTouchEnabled = false // bans drawing with multiple touches
    }
    
    // Specify the settings and Draw
    func drawShapeLayer(path: UIBezierPath)
    {
        canvasLayer?.path = path.cgPath // adds a path
        canvasLayer?.fillColor = lineColor.cgColor // sets the color filled in a sealed shape
        canvasLayer?.opacity = 1 // sets the opacity of drawing
        canvasLayer?.lineWidth = lineWidth // sets the line width of drawing
        canvasLayer?.lineCap = kCALineCapRound // makes the doole curves smoother
        canvasLayer?.strokeColor = lineColor.cgColor // sets the stroke color
        self.layer.addSublayer(canvasLayer!) // adds the drawing to the canvas
        self.setNeedsDisplay() // shows the drawing
    }
    
    // Draw with pan gesture
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer)
    {
        if sender.state == .began
        {
            canvasLayer = CAShapeLayer()
            startPoint = sender.location(in: sender.view) // specifies the starting point
        }
        else if sender.state == .changed
        {
            endPoint = sender.location(in: sender.view) // specifies the ending point
            translation = sender.translation(in: sender.view) // specifies the translation
            
            switch shapeIndex
            {
            case Shape.doodle:
                path = ShapePath().line(startPoint: startPoint, endPoint: endPoint)
                startPoint = endPoint // doodling is made up of tiny line segments, which connect head-to-tail
                canvasLayer = CAShapeLayer() // each line segment needs a layer
            case Shape.line:
                path = ShapePath().line(startPoint: startPoint, endPoint: endPoint)
            case Shape.arc:
                path = ShapePath().arc(startPoint: startPoint, translation: translation)
            case Shape.oval:
                path = ShapePath().oval(startPoint: startPoint, translation: translation)
            case Shape.rectangle:
                path = ShapePath().rectangle(startPoint: startPoint, translation: translation)
            case Shape.roundedRect:
                path = ShapePath().roundedRect(startPoint: startPoint, translation: translation)
            }
            
            drawShapeLayer(path: path!) // starts drawing
        }
    }
    
    // clear the canvas
    func clearCanvas() {
        path?.removeAllPoints()
        self.layer.sublayers = nil
        self.setNeedsLayout()
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
