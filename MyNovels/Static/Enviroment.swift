//
//  Enviroment.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation

enum Environment {
    
    static var serverURL: String {
        return "https://akim.me/mynovels/"
    }
    
    static var debugNetwork: Bool {
        return true //ProcessInfo.processInfo.environment["DEBUG_NETWORK"] == "enabled"
    }
    static var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    static var version: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    static var build: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    static var appStoreID: String {
        return ""
    }

}
