//
//  UIFont+Extension.swift
//  Randlook
//
//  Created by orken serik on 9/11/19.
//  Copyright © 2019 orken serik. All rights reserved.
//

import UIKit


extension UIFont {
    static let fontSize: CGFloat = 14
    
    static public func system() -> UIFont {
        return self.system(size: fontSize)
    }
    
    static public func system(size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size)
    }
    
    static public func bold() -> UIFont {
        return self.bold(size: fontSize)
    }
    
    static public func bold(size: CGFloat) -> UIFont {
        return .boldSystemFont(ofSize: size)
    }
    
    static public func italic() -> UIFont {
        return self.italic(size: fontSize)
    }
    
    static public func italic(size: CGFloat) -> UIFont {
        return .italicSystemFont(ofSize: size)
    }
}
