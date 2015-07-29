//
//  ExClosure.swift
//  places
//
//  Created by Tuan Phung on 5/2/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import Foundation

class ATClosureWrapper<T> {
    var closure: T?
    
    convenience init(closure: T?) {
        self.init()
        
        self.closure = closure
    }
}