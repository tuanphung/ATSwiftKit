//
//  ATAlertView.swift
//  ATSwiftKit
//
//  Created by Tuan Phung on 1/21/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

var UIActionSheetClosureKey = "UIActionSheetClosureKey"
internal typealias UIActionSheetClosure = (selectedOption: String) -> ()

extension UIActionSheet {
    private var at_closure: UIActionSheetClosure? {
        set(value) {
            let closure = ATClosureWrapper(closure: value)
            objc_setAssociatedObject(self, &UIActionSheetClosureKey, closure, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
        }
        get {
            if let wrapper = objc_getAssociatedObject(self, &UIActionSheetClosureKey) as? ATClosureWrapper<UIActionSheetClosure>{
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
        
        actionSheet.at_closure = handler
        
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
        actionSheet.at_closure?(selectedOption: actionSheet.buttonTitleAtIndex(buttonIndex))
    }
}