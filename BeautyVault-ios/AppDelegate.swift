//
//  AppDelegate.swift
//  BeautyVault-ios
//
//  Created by Mario Brezovečki on 08.08.2024..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let authToken = UserDefaults.standard.string(forKey: "AuthToken")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        if authToken != nil {
                    window?.rootViewController = TabBarViewController()
                } else {
                    window?.rootViewController = UINavigationController(rootViewController: OnboardViewController())
                }

        window?.makeKeyAndVisible()

        return true
    }
}
