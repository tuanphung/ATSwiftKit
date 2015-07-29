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
    var ats_onDidLoad: (() -> ())?
    var ats_onWillAppear: (() -> ())?
    var ats_onDidAppear: (() -> ())?
    var ats_onWillDisappear: (() -> ())?
    var ats_onDidDisappear: (() -> ())?

    func ats_setUpComponentsOnLoad() {}
    func ats_setUpComponentsOnWillAppear() {}
    func ats_setUpComponentsOnDidAppear() {}
    func ats_setUpComponentsOnWillDisappear() {}
    func ats_setUpComponentsOnDidDisappear() {}
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.ats_setUpComponentsOnLoad()
        
        self.ats_onDidLoad?()
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.ats_setUpComponentsOnWillAppear()
        
        self.ats_onWillAppear?()
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.ats_setUpComponentsOnDidAppear()
        
        self.ats_onDidAppear?()
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.ats_setUpComponentsOnWillDisappear()
        
        self.ats_onWillDisappear?()
    }
    
    override public func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.ats_setUpComponentsOnDidDisappear()
        
        self.ats_onDidDisappear?()
    }
}