//
//  AppDelegate.swift
//  MyNovels
//
//  Created by Orken Serik on 17.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        InitialConfigurations().load(application: application, launchOptions: launchOptions)
        
        return true
    }
}

