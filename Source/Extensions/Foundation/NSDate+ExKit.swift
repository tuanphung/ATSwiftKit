//
//  NSDate+Extension.swift
//  upaty
//
//  Created by Tuan Phung on 1/8/15.
//  Copyright (c) 2015 Tuan Phung. All rights reserved.
//

import Foundation

extension NSDate {
    func ex_toString(dateFormat: String, timeZone: NSTimeZone! = NSTimeZone.localTimeZone()) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.stringFromDate(self)
    }
}