//
//  ATViewController.swift
//  upaty
//
//  Created by Tuan Phung on 11/5/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import UIKit

class ATViewController: UIViewController {
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