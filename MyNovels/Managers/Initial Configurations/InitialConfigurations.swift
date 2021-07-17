//
//  Initial Configurations.swift
//  sncourse_ios
//
//  Created by Orken Serik on 4/13/21.
//  Copyright © 2021 Orken Serik. All rights reserved.
//

import SVProgressHUD
import Foundation
import UIKit

protocol InitialConfigurationsProtocol: class {
    
    func load(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    
}

class InitialConfigurations: InitialConfigurationsProtocol {
    
    func load(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        configureHUD()
    }
    
}

//MARK: - Methods
extension InitialConfigurations {
    
    private func configureHUD() {
        SVProgressHUD.appearance().tintColor = .black
    }
    
}
