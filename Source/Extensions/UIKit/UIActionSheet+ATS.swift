//
// UIActionSheet+AT.swift
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

var UIActionSheetClosureKey = "UIActionSheetClosureKey"
public typealias UIActionSheetClosure = (selectedOption: String) -> ()

public extension UIActionSheet {
    private var handler: UIActionSheetClosure? {
        set(value) {
            let closure = ATSClosureWrapper(closure: value)
            objc_setAssociatedObject(self, &UIActionSheetClosureKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        }
        get {
            if let wrapper = objc_getAssociatedObject(self, &UIActionSheetClosureKey) as? ATSClosureWrapper<UIActionSheetClosure>{
                return wrapper.closure
            }
            return nil
        }
    }
    
    class func showInView(view: UIView?, title: String?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: UIActionSheetClosure?) -> UIActionSheet {
        return self.showInView(view, title: title, cancelButtonTitle: cancelButtonTitle, destructiveButtonTitle: nil, otherButtonTitles: otherButtonTitles, handler: handler)
    }
    
    class func showInView(view: UIView?, title: String?, cancelButtonTitle: String?, destructiveButtonTitle: String?, otherButtonTitles: [String]?, handler: UIActionSheetClosure?) -> UIActionSheet {
        
        var actionSheet = UIActionSheet(title: title, delegate: nil, cancelButtonTitle: cancelButtonTitle, destructiveButtonTitle: destructiveButtonTitle)
        actionSheet.delegate = actionSheet
        
        if let _otherButtonTitles = otherButtonTitles {
            for buttonTitle in _otherButtonTitles {
                actionSheet.addButtonWithTitle(buttonTitle)
            }
        }
        
        if let _cancelButtonTitle = cancelButtonTitle {
            actionSheet.cancelButtonIndex = actionSheet.addButtonWithTitle(cancelButtonTitle!)
        }
        
        actionSheet.handler = handler
        
        dispatch_async(dispatch_get_main_queue(), {
            if let _view = view {
                actionSheet.showInView(_view)
            }
        })
        
        return actionSheet
    }
}

extension UIActionSheet: UIActionSheetDelegate {
    public func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        actionSheet.handler?(selectedOption: actionSheet.buttonTitleAtIndex(buttonIndex))
    }
}