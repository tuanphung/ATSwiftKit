//
// UIImage+ATS.swift
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

extension UIImage {
    func ats_imageTintedWithColor(color: UIColor, fraction: CGFloat) -> UIImage {
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
    
    func ats_blendingImageWIthColor(color: UIColor) -> UIImage {
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