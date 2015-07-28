//
//  iView.swift
//  upaty
//
//  Created by Tuan Phung on 12/7/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

@IBDesignable
class IBViewDesignable: UIView {
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

class ExView: IBViewDesignable {
    
}
