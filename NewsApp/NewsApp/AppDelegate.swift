//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Даниил Павленко on 26.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let tabBar = TabBarController()
            
            window.rootViewController = tabBar
            window.makeKeyAndVisible()
        }
        
        return true
    }

}
