//
// UIView+ATS.swift
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