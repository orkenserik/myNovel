//
//  Response+Codable.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import Moya

public extension Response {
    
    // MARK: - Convert to an object model
    func mapObject<T: Codable>(_ type: T.Type, path: String? = nil) throws -> T {
        
        do {
            return try JSONDecoder().decode(T.self, from: try getJsonData(path))
        } catch let error as NSError {
            print(error)
            throw MoyaError.jsonMapping(self)
        }
    }
    
    // MARK: - Convert to array model
    func mapArray<T: Codable>(_ type: T.Type, path: String? = nil) throws -> [T] {
        
        do {
            return try JSONDecoder().decode([T].self, from: try getJsonData(path))
        } catch let error as NSError {
            print(error)
            throw MoyaError.jsonMapping(self)
        }
    }
    
    // MARK: - Get the data
    private func getJsonData(_ path: String? = nil) throws -> Data {
        
        do {
            
            var jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            if let path = path {
                
                guard let specificObject = jsonObject.value(forKeyPath: path) else {
                    throw MoyaError.jsonMapping(self)
                }
                jsonObject = specificObject as AnyObject
            }
            
            return try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}
