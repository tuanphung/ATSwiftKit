//
// ATSView.swift
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

@IBDesignable
public class IBDesignableView: UIView {
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.blackColor() {
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
//    @IBInspectable
//    var border: UIEdgeInsets = UIEdgeInsetsZero {
//        didSet(value){
//            border = value
//            self.setNeedsDisplay()
//        }
//    }
//    
//    override func drawRect(rect: CGRect) {
//        super.drawRect(rect)
//        
//        var context = UIGraphicsGetCurrentContext()
//        
//        // Set line color
//        CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor)
//        
//        // Draw line on top
//        if (self.border.top > 0) {
//            CGContextSetLineWidth(context, self.border.top)
//            
//            CGContextMoveToPoint(context, 0, 0)
//            CGContextAddLineToPoint(context, rect.size.width, 0)
//        }
//        
//        // Draw line on bottom
//        if (self.border.bottom > 0) {
//            CGContextSetLineWidth(context, self.border.bottom)
//            
//            CGContextMoveToPoint(context, 0, rect.size.height)
//            CGContextAddLineToPoint(context, rect.size.width, rect.size.height)
//        }
//        
//        // Draw line on Left
//        if (self.border.left > 0) {
//            CGContextSetLineWidth(context, self.border.left)
//            
//            CGContextMoveToPoint(context, 0, 0)
//            CGContextAddLineToPoint(context, 0, rect.size.height)
//        }
//        
//        // Draw line on Right
//        if (self.border.right > 0) {
//            CGContextSetLineWidth(context, self.border.right)
//            
//            CGContextMoveToPoint(context, rect.size.width, 0)
//            CGContextAddLineToPoint(context, rect.size.width, rect.size.height)
//        }
//        
//        CGContextDrawPath(context, kCGPathStroke)
//    }
}

public class ATSView: IBDesignableView { }
