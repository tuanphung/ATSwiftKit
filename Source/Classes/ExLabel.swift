//
//  ILabel.swift
//  upaty
//
//  Created by Tuan Phung on 12/8/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

@IBDesignable
class IBLabelDesignable: UILabel {
    @IBInspectable
    var fontName: String = "" {
        didSet{
            font = UIFont(name: fontName, size: fontSize)
        }
    }
    
    @IBInspectable
    var fontSize: CGFloat = 14 {
        didSet{
            font = UIFont(name: fontName, size: fontSize)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.blackColor() {
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.5 {
        didSet{
            layer.borderWidth = 0.5
        }
    }
}

class ExLabel: IBLabelDesignable {
    
}