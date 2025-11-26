//
//  AppDelegate.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 26.11.2025.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        //window.rootViewController = TaskListViewController()
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}
