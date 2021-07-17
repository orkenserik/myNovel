//
//  String.swift
//  Randlook
//
//  Created by orken serik on 9/10/19.
//  Copyright © 2019 orken serik. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public var parameterFormat: String { return "{i}" }
    
    func notification() -> NSNotification.Name {
        return NSNotification.Name(rawValue: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func toNSNumber() -> NSNumber? {
        if let n = Float(self) {
            return NSNumber(value: n)
        }
        return nil
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var trim : String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    var length:Int {
        return self.count
    }
    
    var withoutSpaces:String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    var isNotEmpty:Bool {
        return !self.isEmpty
    }
    
    func ifEmpty(returnThis string:String) -> String {
        return self.isEmpty ? string : self
    }
    
    func attributed(font: UIFont = UIFont.system(size: 13), color: UIColor = UIColor.gray, line: Bool = false) -> NSAttributedString {
        var attr: [NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font,
                                                  NSAttributedString.Key.foregroundColor: color]
        if line {
            attr[NSAttributedString.Key.underlineStyle] = NSUnderlineStyle.patternDash.rawValue | NSUnderlineStyle.single.rawValue
        }
        return NSAttributedString(string: self, attributes: attr)
    }
}

extension String {
    var first: String {
        return String(prefix(1))
    }
    var last: String {
        return String(suffix(1))
    }
    var uppercaseEachFirst: String {
        var words = [String]()
        for word in self.components(separatedBy: " ") {
            words.append(word.uppercaseFirst)
        }
        return words.joined(separator: " ")
    }
    var uppercaseFirst: String {
        return first.uppercased() + String(dropFirst())
    }
    var lowercaseAndUppercaseEachFirst: String {
        return self.lowercased().uppercaseEachFirst
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension Double {
    func toCurency(_ currencyTypeStr: String) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = currencyTypeStr
        currencyFormatter.locale = Locale.current
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
    func round(to places: Int = 2) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Int {
    func toDecimal() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.groupingSeparator = " "
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

extension String {
    var textWithoutPhoneMask: String {
        if self.count == 0 {
            return self
        }
        
        var result = self
        
        // remove country code 8 or +7
//        if result[result.startIndex] == "8" {
//            result.remove(at: result.startIndex)
//        }
        result = result.replacingOccurrences(of: "+7", with: "7")
        
        // remove special characters
        result = result.replacingOccurrences(of: " ", with: "")
        result = result.replacingOccurrences(of: "(", with: "")
        result = result.replacingOccurrences(of: ")", with: "")
        result = result.replacingOccurrences(of: "-", with: "")
        
        var cleanResult = ""
        for c in result {
            if CharacterSet.decimalDigits.contains(String(c).unicodeScalars.first!) {
                cleanResult += String(c)
            }
        }
        
        return cleanResult
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlStripped : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
