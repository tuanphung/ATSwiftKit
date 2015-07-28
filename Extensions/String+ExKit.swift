//
//  NSString+extension.swift
//  upaty
//
//  Created by Le Minh Duy on 12/13/14.
//  Copyright (c) 2014 Tuan Phung. All rights reserved.
//

import Foundation

extension String {
    func ex_toDate(format: String, timeZone: NSTimeZone! = NSTimeZone.localTimeZone()) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
}