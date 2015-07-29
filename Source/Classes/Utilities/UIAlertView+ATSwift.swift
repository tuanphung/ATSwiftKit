//
//  IAlertView.swift
//  upaty
//
//  Created by Tuan Phung on 1/21/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

internal var UIAlertViewClosureKey = "UIAlertViewClosureKey"
internal typealias UIAlertViewClosure = (selectedOption: String) -> ()

extension UIAlertView {
    private var at_closure: UIAlertViewClosure? {
        set(value) {
            let closure = ATClosureWrapper(closure: value)
            objc_setAssociatedObject(self, &UIAlertViewClosureKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        }
        get {
            if let wrapper = objc_getAssociatedObject(self, &UIAlertViewClosureKey) as? ATClosureWrapper<UIAlertViewClosure>{
                return wrapper.closure
            }
            return nil
        }
    }
    
    class func show(title: String?, message: String?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: UIAlertViewClosure?) -> UIAlertView {
        return self.show(title, message: message, accessoryView: nil, cancelButtonTitle: cancelButtonTitle, otherButtonTitles: otherButtonTitles, handler: handler)
    }
    
    class func show(title: String?, message: String?, accessoryView: UIView?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: UIAlertViewClosure?) -> UIAlertView {
        
        var alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: nil)
        alertView.delegate = alertView
        
        if let _accessoryView = accessoryView {
            alertView.setValue(_accessoryView, forKey: "accessoryView")
        }
        
        if let _otherButtonTitles = otherButtonTitles {
            for buttonTitle in _otherButtonTitles {
                alertView.addButtonWithTitle(buttonTitle)
            }
        }
        
        if let _cancelButtonTitle = cancelButtonTitle {
            alertView.cancelButtonIndex = alertView.addButtonWithTitle(cancelButtonTitle!)
        }
        
        alertView.at_closure = handler
        
        dispatch_async(dispatch_get_main_queue(), {
            alertView.show()
        })
        
        return alertView
    }
}

extension UIAlertView: UIAlertViewDelegate {
    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        alertView.setValue(nil, forKey: "accessoryView")
        alertView.at_closure?(selectedOption: alertView.buttonTitleAtIndex(buttonIndex))
    }
}