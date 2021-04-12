//
//  AppDelegate.swift
//  Life Cycle
//
//  Created by Stanislav Leontyev on 03.12.2020.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var appConfiguration: AppConfiguration?

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        appConfiguration = AppConfiguration.allCases.randomElement()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
