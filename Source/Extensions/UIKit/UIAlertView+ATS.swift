//
// UIAlertView+ATS.swift
//
// Copyright (c) 2015 PHUNG ANH TUAN. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

var UIAlertViewClosureKey = "UIAlertViewClosureKey"
public typealias UIAlertViewClosure = (selectedOption: String) -> ()

public extension UIAlertView {
    private var handler: UIAlertViewClosure? {
        set(value) {
            let closure = ATSClosureWrapper(closure: value)
            objc_setAssociatedObject(self, &UIAlertViewClosureKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        }
        get {
            if let wrapper = objc_getAssociatedObject(self, &UIAlertViewClosureKey) as? ATSClosureWrapper<UIAlertViewClosure>{
                return wrapper.closure
            }
            return nil
        }
    }
    
    public class func show(title: String?, message: String?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: UIAlertViewClosure?) -> UIAlertView {
        return self.show(title, message: message, accessoryView: nil, cancelButtonTitle: cancelButtonTitle, otherButtonTitles: otherButtonTitles, handler: handler)
    }
    
    public class func show(title: String?, message: String?, accessoryView: UIView?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: UIAlertViewClosure?) -> UIAlertView {
        
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
        
        alertView.handler = handler
        
        dispatch_async(dispatch_get_main_queue(), {
            alertView.show()
        })
        
        return alertView
    }
}

extension UIAlertView: UIAlertViewDelegate {
    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        alertView.setValue(nil, forKey: "accessoryView")
        alertView.handler?(selectedOption: alertView.buttonTitleAtIndex(buttonIndex))
    }
}