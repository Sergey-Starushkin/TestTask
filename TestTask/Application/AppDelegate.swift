//
//  AppDelegate.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigationController()
        return true
    }
    
    func setupNavigationController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        if #available(iOS 13.0, *) { self.window?.overrideUserInterfaceStyle = .light }
        navigationController.viewControllers = [LoginViewController()]
        navigationController.setNavigationBarHidden(true, animated: false)
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}

