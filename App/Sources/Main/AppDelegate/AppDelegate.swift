//
//  AppDelegate.swift
//  AppName-Clone
//
//  Created by Hardijs Ķirsis on 17/05/2023.
//

import UIKit
import ApplicationBusinessRules

class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    lazy var window: UIWindow? = Composition.resolve()
    
    // MARK: - LifeCycle
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startup()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        terminate()
    }
}
