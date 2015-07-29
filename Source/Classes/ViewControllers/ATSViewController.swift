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

class ATSViewController: UIViewController {
    func ex_setUpComponentsOnLoad() {}
    func ex_setUpComponentsOnWillAppear() {}
    func ex_setUpComponentsOnDidAppear() {}
    func ex_setUpComponentsOnWillDisappear() {}
    func ex_setUpComponentsOnDidDisappear() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ex_setUpComponentsOnLoad()
        
        self.ex_onDidLoad?()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.ex_setUpComponentsOnWillAppear()
        
        self.ex_onWillAppear?()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.ex_setUpComponentsOnDidAppear()
        
        self.ex_onDidAppear?()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.ex_setUpComponentsOnWillDisappear()
        
        self.ex_onWillDisappear?()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.ex_setUpComponentsOnDidDisappear()
        
        self.ex_onDidDisappear?()
    }
    
    /*
    Manage block to execute when ViewController Life-Cycle is already executed
    */
    var ex_onDidLoad: (() -> ())?
    var ex_onWillAppear: (() -> ())?
    var ex_onDidAppear: (() -> ())?
    var ex_onWillDisappear: (() -> ())?
    var ex_onDidDisappear: (() -> ())?
}