//
// ATSViewController.swift
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

public class ATSViewController: UIViewController {

    // Manage block to execute when ViewController Life-Cycle is already executed
    public var onDidLoad: (() -> ())?
    public var onWillAppear: (() -> ())?
    public var onDidAppear: (() -> ())?
    public var onWillDisappear: (() -> ())?
    public var onDidDisappear: (() -> ())?

    public func setUpComponentsOnLoad() {}
    public func setUpComponentsOnWillAppear() {}
    public func setUpComponentsOnDidAppear() {}
    public func setUpComponentsOnWillDisappear() {}
    public func setUpComponentsOnDidDisappear() {}
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpComponentsOnLoad()
        self.onDidLoad?()
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setUpComponentsOnWillAppear()
        self.onWillAppear?()
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.setUpComponentsOnDidAppear()
        self.onDidAppear?()
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.setUpComponentsOnWillDisappear()
        self.onWillDisappear?()
    }
    
    public override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.setUpComponentsOnDidDisappear()
        self.onDidDisappear?()
    }
}