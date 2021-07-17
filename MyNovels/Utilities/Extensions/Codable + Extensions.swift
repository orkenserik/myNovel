//
//  Codable + Extensions.swift
//  Randlook
//
//  Created by orken serik on 12/3/19.
//  Copyright © 2019 orken serik. All rights reserved.
//

import Foundation
//
//extension Encodable {
//  func asDictionary() throws -> [String: Any] {
//    let data = try JSONEncoder().encode(self)
//    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
//      throw NSError()
//    }
//    return dictionary
//  }
//}

import UIKit

protocol Parameters: Codable {
    func toData() -> Data?
    
}

extension Parameters where Self: Codable {
    func toData() -> Data? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return data
    }
    
    func toDict() -> [String:Any] {
        guard let data = toData() else {
            return [:]
        }
        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return [:]
        }
        return dict as? [String : Any] ?? [:]
    }
  
}

extension Dictionary where Key: ExpressibleByStringLiteral, Value:Any {

    func toData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return data
    }
}


extension Data
{
    func toString() -> String
    {
        return String(data: self, encoding: .utf8)!
    }
}
