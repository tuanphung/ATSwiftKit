//
// ATSTextView.swift
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

class ATSTextView: UITextView, UITextViewDelegate {
    
    var autoGrowing: Bool = true
    var onSizeChanged: (() -> ())?
    
    //MARK: Properties
    var minHeightConstraint: NSLayoutConstraint?
    var maxHeightConstraint: NSLayoutConstraint?
    
    //MARK: UIProperties
    var placeholderLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.initialize()
    }
    
    func initialize() {
        self.associateConstraints()
        
        self.textContainerInset = UIEdgeInsetsMake(10,5,10,5)
        let placeholderPoint = CGPointMake(10, 10)
        self.placeholderLabel = UILabel(frame: CGRectMake(placeholderPoint.x, placeholderPoint.y, self.bounds.size.width - 2*placeholderPoint.x, 20))
        self.placeholderLabel.textColor = UIColor(hex: 0x58585B)
        self.placeholderLabel.font = self.font
        self.addSubview(self.placeholderLabel)
        
        self.delegate = self
    }

    func associateConstraints() {
        // iterate through all text view's constraints and identify
        // height, max height and min height constraints.
        for constraint in self.constraints() as! [NSLayoutConstraint] {
            if (constraint.firstAttribute == .Height) {
                if (constraint.relation == .LessThanOrEqual) {
                    self.maxHeightConstraint = constraint
                }
                else if (constraint.relation == .GreaterThanOrEqual) {
                    self.minHeightConstraint = constraint
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.scrollEnabled = true
    }
    
    func textViewDidChange(textView: UITextView) {
        if (self.autoGrowing) {
            // calculate size needed for the text to be visible without scrolling
            let sizeThatFits = self.sizeThatFits(self.frame.size)
            var newHeight = sizeThatFits.height
            
            // if there is any minimal height constraint set, make sure we consider that
            if let _minHeightConstraint = self.minHeightConstraint {
                newHeight = max(newHeight, _minHeightConstraint.constant)
            }
            
            // if there is any maximal height constraint set, make sure we consider that
            if let _maxHeightConstraint = self.maxHeightConstraint {
                newHeight = min(newHeight, _maxHeightConstraint.constant)
            }
            
            self.scrollEnabled = false
            // update the height constraint
            if let heightConstraint = self.ex_heightConstraint() {
                heightConstraint.constant = newHeight
                self.onSizeChanged?()
            }
        }
        
        if (self.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0) {
            self.placeholderLabel.hidden = true
        }
        else {
            self.placeholderLabel.hidden = false
        }
    }
    
    func setPlaceholder(placeholder: String) {
        self.placeholderLabel.text = placeholder
    }
}
