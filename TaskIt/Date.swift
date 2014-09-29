//
//  Date.swift
//  TaskIt
//
//  Created by Kaeli Lo on 29/9/14.
//  Copyright (c) 2014 Kaeli Lo. All rights reserved.
//

import Foundation

class Date {
    class func at(#year: Int, month: Int, day: Int) -> NSDate {
        var component = NSDateComponents()
        component.year = year
        component.month = month
        component.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar.dateFromComponents(component)
        
        return date!
    }
    
    class func toString(#date: NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateStringFormatter.stringFromDate(date)
    }
}