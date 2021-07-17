//
//  String+Date+Extensions.swift
//  Randlook
//
//  Created by orken serik on 9/10/19.
//  Copyright © 2019 orken serik. All rights reserved.
//

import UIKit

enum DateFormat: String {
    case withoutTimeDush = "yyyy-MM-dd"
    case withTimeDush = "yyyy-MM-dd HH:mm:ss"
    case withoutTimeDot =  "dd.MM.yyyy"
    case withTimeDot =  "dd.MM.yyyy HH:mm"
    case dd_month_yyyy = "dd MMMM yyyy"
    case month_yyyy = "LLLL yyyy"
    case MMMddTimeYYYY = "MMM dd HH:mm:ss yyyy"
    case bafFormat = "yyyyMMddHHmmss"
    //    case natioanlStandart = "YYYY-MM-dd\'T\'HH:mm:ss"
    
    //  case natioanlStandart = "YYYY-MM-dd\'T\'HH:mm:ssXXX"
    case natioanlStandart = "YYYY-MM-dd\'T\'HH:mm:ssZ"
    case natioanl2Standart = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    
}


extension Date {
    func to(timeZone outputTimeZone: TimeZone, from inputTimeZone: TimeZone) -> Date {
         let delta = TimeInterval(outputTimeZone.secondsFromGMT(for: self) - inputTimeZone.secondsFromGMT(for: self))
         return addingTimeInterval(delta)
    }
}


extension String {
    
    func date() -> Date? {
        return date(format: .bafFormat)
    }
    
    func date(format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        if format == .MMMddTimeYYYY {
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        }
        dateFormatter.dateFormat = format.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func dateString() -> String {
        return dateString(withFormat: .withTimeDush,
                          toFormat: .withTimeDot,
                          locale: nil)
    }
    
    func dateString(toFormat: DateFormat) -> String {
        return dateString(withFormat: .withTimeDush,
                          toFormat: toFormat,
                          locale: nil)
    }
    
    func dateString(withFormat: DateFormat, toFormat: DateFormat, locale: String? = nil) -> String {
        let dateFormatter = DateFormatter()
        if locale != nil {
            dateFormatter.locale = Locale(identifier: locale!)
        }
        dateFormatter.dateFormat = withFormat.rawValue
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat.rawValue
            dateFormatter.timeZone = .current
            let newSt = dateFormatter.string(from: date)
            return newSt
        }
        return self
    }
    
    
}



extension Date {
    
    func string() -> String {
        return string(format: .withoutTimeDot)
    }
    
    func string(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let str = dateFormatter.string(from: self)
        return str
    }
    
    
}

