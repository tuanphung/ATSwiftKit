//
//  ITextField.swift
//  upaty
//
//  Created by Tuan Phung on 1/14/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

@IBDesignable
class IBDesignableTextField: UITextField {
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

class ATTextField: IBDesignableTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        self.addTarget(self, action: "focusNextField", forControlEvents: .EditingDidEndOnExit)
    }
    
    func focusNextField() {
        self.resignFirstResponder()
    }
}