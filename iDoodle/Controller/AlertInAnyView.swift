//
//  AlertInAnyView.swift
//  iDoodle
//
//  Created by Xiaofeng Lin on 4/04/18.
//  Copyright © 2018 Xiaofeng Lin. All rights reserved.
//

import UIKit

// Used to show an alert in views that are not the top view controller, only which has the present() method
extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}
