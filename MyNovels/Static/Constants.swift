//
//  Constants.swift
//  sunlight_ios
//
//  Created by Orken Serik on 8/18/20.
//  Copyright © 2020 Orken Serik. All rights reserved.
//

import Foundation
import UIKit

struct App {

    // MARK: - Cell Identifiers

    struct CellIdentifier {
        static let bookCellId = "bookCellId"
    }
    
    struct ScreenSize {
        static let width = UIScreen.main.bounds.size.width
        static let height = UIScreen.main.bounds.size.height
    }

    // MARK: - Fields

    struct Field {
        static let `default` = "error"
        static let message = "message"
        static let login = "Login"
        static let password = "Password"
    }
}

// MARK: - Notifications

extension Foundation.Notification.Name {
    static let startLoading = Foundation.Notification.Name("startLoading")
    static let stopLoading = Foundation.Notification.Name("stopLoading")
}
