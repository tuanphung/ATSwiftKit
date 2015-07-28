//
//  NSData+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 12/16/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import Foundation

extension NSData {
    func ex_toString(encoding: UInt = NSUTF8StringEncoding) -> String {
        let length = self.length
        var buffer = [UInt8](count: length, repeatedValue:0)
        self.getBytes(&buffer, length: length)
        
        if let string = String(bytes:buffer, encoding:NSUTF8StringEncoding) {
            return string
        }
        
        return ""
    }
}