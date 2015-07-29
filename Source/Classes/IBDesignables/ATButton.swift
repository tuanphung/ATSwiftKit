//
//  IButton.swift
//  upaty
//
//  Created by Tuan Phung on 1/6/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

@IBDesignable
class IBDesignableButton: UIButton {
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
}

class ATButton: IBDesignableButton { }