//
//  Error + Extension.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/18/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import Moya

extension Error {

    func parseMessages() -> [String: String] {
        var errorMessages = [String: String]()
        if let moyaError = self as? MoyaError {
            if let response = moyaError.response {
                let responseError = response.parseError()
                errorMessages = responseError.message
            }
        }

        return errorMessages
    }

}
