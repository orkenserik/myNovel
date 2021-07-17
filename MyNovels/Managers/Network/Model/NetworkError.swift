//
//  NetworkError.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation

struct NetworkError : Error, Codable {
    
    let message: String?
    let errors: [String: [String]]?
}
