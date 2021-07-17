//
//  AuthApi.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/14/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import Moya

enum NovelApi {
    case library
    case chapter
}

extension NovelApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Environment.serverURL) else {
            fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .library:
            return "library.php"
        case .chapter:
            return "chapter.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String : Any] {
        switch self {
        default:
            return [:]
        }
    }
    
    var task: Task {
        
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let header: [String : String]  = [
            "Content-type": "application/json",
            "Accept":"application/json"
            ]
        return header
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}



