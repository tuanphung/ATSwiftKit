//
//  ATAlertView.swift
//  ATSwiftKit
//
//  Created by Tuan Phung on 1/21/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

class ExActionSheet: UIActionSheet {
    var handler: ((selectedOption: String) -> ())?
}

class ExActionSheetManager: NSObject {
    class var sharedInstance: ExActionSheetManager {
        struct Static {
            static var instance: ExActionSheetManager?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ExActionSheetManager()
        }
        
        return Static.instance!
    }
    
    class func showInView(view: UIView?, title: String?, cancelButtonTitle: String?, otherButtonTitles: [String]?, handler: ((selectedOption: String) -> ())?) -> ExActionSheet {
        return self.showInView(view, title: title, cancelButtonTitle: cancelButtonTitle, destructiveButtonTitle: nil, otherButtonTitles: otherButtonTitles, handler: handler)
    }
    
    class func showInView(view: UIView?, title: String?, cancelButtonTitle: String?, destructiveButtonTitle: String?, otherButtonTitles: [String]?, handler: ((selectedOption: String) -> ())?) -> ExActionSheet {
        
        var actionSheet = ExActionSheet(title: title, delegate: self.sharedInstance, cancelButtonTitle: cancelButtonTitle, destructiveButtonTitle: destructiveButtonTitle)
        
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

extension ExActionSheetManager: UIActionSheetDelegate {
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if let _actionSheet = actionSheet as? ExActionSheet {
            _actionSheet.handler?(selectedOption: _actionSheet.buttonTitleAtIndex(buttonIndex))
        }
    }
}