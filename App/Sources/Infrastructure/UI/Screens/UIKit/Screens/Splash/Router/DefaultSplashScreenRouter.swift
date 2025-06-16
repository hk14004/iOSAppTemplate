//
//  DefaultSplashVMRouter.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import UIKit
import InterfaceAdapters
import DevToolsNavigation

class DefaultSplashScreenRouter: SplashScreenRouter, UIKitRouter {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToRoot() {
        print("routeToRoot")
    }
}

extension ToSplashScreenRouting {
    func routeToSplashScreen() {
        let screenFactory: SplashScreenFactory = Composition.resolve()
        let vc: SplashScreenVC = screenFactory.make()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        let rootWindow: UIWindow = Composition.resolve()
        rootWindow.rootViewController = nav
        rootWindow.makeKeyAndVisible()
    }
}
