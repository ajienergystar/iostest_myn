//
//  AppDelegate.swift
//  iOS Testing
//
//  Created by Aji Prakosa on 07/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
                  
        let rootVC = HomeViewController()
        let navController = BaseNavigationController(rootViewController: rootVC)
        window?.rootViewController = navController

        return true
    }

}

