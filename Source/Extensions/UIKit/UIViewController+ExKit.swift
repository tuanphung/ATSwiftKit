//
//  UIViewController+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 12/6/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

var ExAssociatedOnDidLoadKey = "ExAssociatedOnDidLoadKey"
var ExAssociatedOnWillAppearKey = "ExAssociatedOnWillAppearKey"
var ExAssociatedOnDidAppearKey = "ExAssociatedOnDidAppearKey"
var ExAssociatedOnWillDisappearKey = "ExAssociatedOnWillDisappearKey"
var ExAssociatedOnDidDisappearKey = "ExAssociatedOnDidDisappearKey"

extension UIViewController {
    /*
    *** Class Methods ***
    */
    class func ex_instanceFromNib() -> UIViewController! {
        var _nibName: String! = nil
        
        let fullClassName = NSStringFromClass(self)
        if let className = fullClassName.componentsSeparatedByString(".").last {
            _nibName = className
        }
        
        // Load from nib
        return self(nibName: _nibName, bundle: nil)
    }
    
    class func ex_instanceFromNib(nibName: String?, bundle: NSBundle?) -> UIViewController! {
        var _nibName: String! = nil
        
        // If nibName == nil, get default name is Classname
        if (nibName == nil) {
            let fullClassName = NSStringFromClass(self)
            if let className = fullClassName.componentsSeparatedByString(".").last {
                _nibName = className
            }
        }
        else {
            _nibName = nibName
        }

        // Load from nib
        return self(nibName: _nibName, bundle: bundle)
    }
    
    /*
    *** Instance Methods ***
    */
    final func ex_defaultNavigationController() -> UINavigationController {
        // Return current NavigationController
        // If not, create new instance of NavigationController
        if let nav = self.navigationController {
            return nav
        }
        else {
            return UINavigationController(rootViewController: self)
        }
    }
}