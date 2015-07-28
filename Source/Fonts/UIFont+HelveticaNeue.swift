//
//  uPatyFont.swift
//  upaty
//
//  Created by Tuan Phung on 12/7/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

extension UIFont {
    class func HelveticaRegular(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: fontSize)!
    }
    
    class func HelveticaLight(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: fontSize)!
    }
    
    class func HelveticaBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: fontSize)!
    }
    
    class func HelveticaMedium(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: fontSize)!
    }
}