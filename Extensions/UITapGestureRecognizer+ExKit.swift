//
//  UITapGestureRecognizer+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 2/26/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

var ExAssociatedTapGestureRecognizerKey = "ExAssociatedTapGestureRecognizerKey"

extension UITapGestureRecognizer {
    
    convenience init(block: (() -> ())?) {
        self.init()
        
        self.addTarget(self, action: "tap")
        objc_setAssociatedObject(self, &ExAssociatedTapGestureRecognizerKey, ExClosure(block: block), objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN))
    }
    
    func block() -> (() -> ())? {
        var closure = objc_getAssociatedObject(self, &ExAssociatedTapGestureRecognizerKey) as! ExClosure
        return closure.block
    }
    
    func tap() {
        self.block()?()
    }
}
