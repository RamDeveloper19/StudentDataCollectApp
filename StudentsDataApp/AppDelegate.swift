//
//  AppDelegate.swift
//  StudentsDataApp
//
//  Created by kumar on 01/04/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        LocalDataBase.shared.fetchStudentDetails()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let launch = UINavigationController(rootViewController: StudentListVC())
        launch.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = launch
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        LocalDataBase.shared.saveContext()
        
    }
    

}

