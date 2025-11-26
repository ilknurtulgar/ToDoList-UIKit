//
//  AppDelegate.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 26.11.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        print("AppDelegate didFinishLaunching")

        window = UIWindow(frame: UIScreen.main.bounds)
        print("Window created: \(window != nil)")

        let taskListVC = TaskListViewController()
        let navController = UINavigationController(rootViewController: taskListVC)

        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }

}
