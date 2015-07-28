//
//  IAlertView.swift
//  upaty
//
//  Created by Tuan Phung on 1/21/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

class ExAlertView: UIAlertView {
    var handler: ((selectedOption: String) -> ())?
}

class ExAlertManager: NSObject {
    class var sharedInstance: ExAlertView {
        struct Static {
            static var instance: ExAlertView?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ExAlertView()
        }
        
        return Static.instance!
    }
    
    class func show(title: String?, message: String?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: ((selectedOption: String) -> ())?) -> ExAlertView {
       return self.show(title, message: message, accessoryView: nil, cancelButtonTitle: cancelButtonTitle, otherButtonTitles: otherButtonTitles, handler: handler)
    }
    
    class func show(title: String?, message: String?, accessoryView: UIView?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: ((selectedOption: String) -> ())?) -> ExAlertView {
        
        var alertView = ExAlertView(title: title, message: message, delegate: self.sharedInstance, cancelButtonTitle: nil)
        
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

extension ExAlertManager: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if let _alertView = alertView as? ExAlertView {
            _alertView.setValue(nil, forKey: "accessoryView")
            _alertView.handler?(selectedOption: _alertView.buttonTitleAtIndex(buttonIndex))
        }
    }
}