//
//  ViewController.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 2/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Canvas
    @IBOutlet weak var canvasView: CanvasView!
    
    // Clear
    @IBAction func clearCanvas(_ sender: UIButton) {
        // Create an alert for user confirmation before clearing the canvas
        let alert = UIAlertController(title: "Warning!", message: "Are you sure to clear the canvas?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            self.canvasView.clearCanvas()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        // Show the alert
        self.present(alert, animated: true)
    }
    
    
    // Save Drawing
    @IBAction func saveDrawing(_ sender: UIButton) {
        // Convert the content of the canvas to an image
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, canvasView.isOpaque, 0.0)
        canvasView.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: false)
        let canvasImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Save the converted image
        UIImageWriteToSavedPhotosAlbum(canvasImage!, self, #selector(self.image), nil)
    }
    
    // Create a callback for telling user that image has been saved successfully
    @objc func image(image: UIImage, withPotentialError error: NSErrorPointer, contextInfo: UnsafeRawPointer) {
        let alert = UIAlertController(title: "Great!", message: "Image Saved Successfully!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

