//
//  AppDelegate.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.changeNavigationBarDesign()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: NewsList())
        window?.makeKeyAndVisible()
        return true
    }
    
    private func changeNavigationBarDesign() {
        UINavigationBar.appearance().backgroundColor = UIColor.gray
        UINavigationBar.appearance().prefersLargeTitles = true
        UIBarButtonItem.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }


}

