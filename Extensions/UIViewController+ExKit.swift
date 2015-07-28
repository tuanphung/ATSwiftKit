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
    
    /*
        Manage block to execute when ViewController Life-Cycle is already executed
    */
    final func ex_onDidLoad() -> (() -> ())? {
        if let closure = objc_getAssociatedObject(self, &ExAssociatedOnDidLoadKey) as? ExClosure {
            return closure.block
        }
        return nil
    }
    
    final func ex_setOnDidLoad(block: (() -> ())?) {
        let closure = ExClosure(block: block)
        objc_setAssociatedObject(self, &ExAssociatedOnDidLoadKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    final func ex_onWillAppear() -> (() -> ())? {
        if let closure = objc_getAssociatedObject(self, &ExAssociatedOnWillAppearKey) as? ExClosure {
            return closure.block
        }
        return nil
    }
    
    final func ex_setOnWillAppear(block: (() -> ())?) {
        let closure = ExClosure(block: block)
        objc_setAssociatedObject(self, &ExAssociatedOnWillAppearKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    final func ex_onDidAppear() -> (() -> ())? {
        if let closure = objc_getAssociatedObject(self, &ExAssociatedOnDidAppearKey) as? ExClosure {
            return closure.block
        }
        return nil
    }
    
    final func ex_setOnDidAppear(block: (() -> ())?) {
        let closure = ExClosure(block: block)
        objc_setAssociatedObject(self, &ExAssociatedOnDidAppearKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    final func ex_onWillDisappear() -> (() -> ())? {
        if let closure = objc_getAssociatedObject(self, &ExAssociatedOnWillDisappearKey) as? ExClosure {
            return closure.block
        }
        return nil
    }
    
    final func ex_setOnWillDisappear(block: (() -> ())?) {
        let closure = ExClosure(block: block)
        objc_setAssociatedObject(self, &ExAssociatedOnWillDisappearKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    final func ex_onDidDisappear() -> (() -> ())? {
        if let closure = objc_getAssociatedObject(self, &ExAssociatedOnDidDisappearKey) as? ExClosure {
            return closure.block
        }
        return nil
    }
    
    final func ex_setOnDidDisappear(block: (() -> ())?) {
        let closure = ExClosure(block: block)
        objc_setAssociatedObject(self, &ExAssociatedOnDidDisappearKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    func ex_setUpComponentsOnLoad() {}
    func ex_setUpComponentsOnWillAppear() {}
    func ex_setUpComponentsOnDidAppear() {}
    func ex_setUpComponentsOnWillDisappear() {}
    func ex_setUpComponentsOnDidDisappear() {}
}