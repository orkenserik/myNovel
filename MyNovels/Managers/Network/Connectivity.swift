//
//  Connectivity.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity: NSObject {
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func isReachableM() -> Bool {
        if isConnectedToInternet() {
            return true
        }else {
            return false
        }
    }
}
