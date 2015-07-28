//
//  UIView+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 12/7/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

extension UIView {
    func ex_leadingConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Leading) {
                return constraint
            }
        }
        
        return nil
    }
    
    func ex_trailingConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Trailing) {
                return constraint
            }
        }
        
        return nil
    }
    
    func ex_topConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Top) {
                return constraint
            }
        }
        
        return nil
    }
    
    func ex_bottomConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Bottom) {
                return constraint
            }
        }
        
        return nil
    }
    
    func ex_heightConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Height) {
                return constraint
            }
        }
        
        return nil
    }
    
    func ex_widthConstraint() -> NSLayoutConstraint? {
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Width) {
                return constraint
            }
        }
        
        return nil
    }
}