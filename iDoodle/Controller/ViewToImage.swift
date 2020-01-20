//
//  ViewToImage.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 4/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// Used to convert the content of a view to an image for saving
extension UIImage{
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}
