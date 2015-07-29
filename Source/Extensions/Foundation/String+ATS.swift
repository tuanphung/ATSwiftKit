//
// String+ATS.Swift
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

import Foundation

public extension String {
    static func randomString(length: Int) -> String {
        let characterSet = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        var randomString = ""
        for i in 0..<length {
            let randomIndex = Int(arc4random_uniform(UInt32(count(characterSet))))
            randomString += characterSet.substringWithRange(Range<String.Index>(start: advance(characterSet.startIndex, randomIndex), end: advance(characterSet.startIndex, randomIndex + 1)))
        }
        
        return randomString
    }
    
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    
    func toDate(format: String, timeZone: NSTimeZone! = NSTimeZone.localTimeZone(), locale: NSLocale! = NSLocale(localeIdentifier: "en_US")) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(self)
    }
    
    func toDate() -> NSDate? {
        return self.toDate("yyyyMMddHHmmssZ", timeZone: nil, locale: nil)
    }
    
    func toDate(dateFormat: String) -> NSDate? {
        return self.toDate(dateFormat, timeZone: nil, locale: nil)
    }
    
    func toDate(dateFormat: String, timeZone: NSTimeZone) -> NSDate? {
        return self.toDate(dateFormat, timeZone: timeZone, locale: nil)
    }
}