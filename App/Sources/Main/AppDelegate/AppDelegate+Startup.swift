//
//  AppDelegate+Startup.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import UIKit

extension AppDelegate {
    func startup() {
        registerApplicationLaunch()
        AppAppearance.configureAppearance()
        routeToSplashScreen()
    }
}

fileprivate extension AppDelegate {
    func routeToPreview() {
        fatalError()
//        let screenFactory = DefaultPreviewScreenFactory()
//        let vc = screenFactory.make()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.navigationBar.isHidden = true
//        let rootWindow: UIWindow = Composition.resolve()
//        rootWindow.rootViewController = nav
//        rootWindow.makeKeyAndVisible()
    }
}
