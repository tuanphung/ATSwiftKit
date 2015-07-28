//
//  ExClosure.swift
//  places
//
//  Created by Tuan Phung on 5/2/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import Foundation

class ExClosure {
    var block: (() -> ())?
    
    convenience init(block: (() -> ())?) {
        self.init()
        
        self.block = block
    }
}