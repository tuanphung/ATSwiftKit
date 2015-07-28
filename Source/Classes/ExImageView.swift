//
//  iImageView.swift
//  upaty
//
//  Created by Tuan Phung on 12/7/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

@IBDesignable
class IBImageViewDesignable: UIImageView {
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

class ExImageView: IBImageViewDesignable {
    var autoCircle: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (self.autoCircle) {
            self.layer.cornerRadius = self.bounds.size.width / 2
        }
    }
}