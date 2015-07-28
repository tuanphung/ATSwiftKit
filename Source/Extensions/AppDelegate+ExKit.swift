//
//  AppDelegate+Extension.swift
//  ipromise
//
//  Created by Tuan Phung on 1/29/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import UIKit

extension AppDelegate {
    class func sharedInstance() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }
}