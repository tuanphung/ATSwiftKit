//
//  UIImage+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 2/4/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

extension UIImage {
    func ex_imageTintedWithColor(color: UIColor, fraction: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        var rect = CGRectZero
        rect.size = self.size
        
        color.set()
        UIRectFill(rect)
        self.drawInRect(rect, blendMode: kCGBlendModeDestinationIn, alpha: 1.0)
        
        if fraction > 0 {
            self.drawInRect(rect, blendMode: kCGBlendModeSourceAtop, alpha: fraction)
        }
        
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func ex_blendingImageWIthColor(color: UIColor) -> UIImage {
        // begin a new image context, to draw our colored image onto
        UIGraphicsBeginImageContext(self.size)
        
        // get a reference to that context we created
        var context = UIGraphicsGetCurrentContext()
        
        // set the fill color
        color.setFill()
        
        // translate/flip the graphics context (for transforming from CG* coords to UI* coords
        CGContextTranslateCTM(context, 0, self.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        
        // set the blend mode to color burn, and the original image
        CGContextSetBlendMode(context, kCGBlendModeColorBurn);
        var rect = CGRectMake(0, 0, self.size.width, self.size.height);
        CGContextDrawImage(context, rect, self.CGImage);
        
        // set a mask that matches the shape of the image, then draw (color burn) a colored rectangle
        CGContextClipToMask(context, rect, self.CGImage);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context,kCGPathFill);
        
        // generate a new UIImage from the graphics context we drew onto
        var coloredImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return the color-burned image
        return coloredImg;
    }
}