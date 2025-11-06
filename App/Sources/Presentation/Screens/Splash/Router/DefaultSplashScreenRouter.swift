//
//  DefaultSplashVMRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import UIKit
import DevToolsNavigation
import TemplateLogin
import TemplateApplication

class DefaultSplashScreenRouter: SplashScreenRouter, UIKitRouter {
    var simpleLoginScreenFactory: any SimpleLoginScreenFactory
    
    func routeToOkeyErrorAlert(_ error: any Error, onDismiss: (() -> Void)?) {
        
    }
    
    weak var viewController: UIViewController?
    
    init(
        viewController: UIViewController,
        simpleLoginScreenFactory: any SimpleLoginScreenFactory
    ) {
        self.viewController = viewController
        self.simpleLoginScreenFactory = simpleLoginScreenFactory
    }
    
    func routeToOnboarding() {
        print("routeToOnboarding")
    }
    
    func routeToLoggedIn() {
        let screenFactory: any LoggedInScreenFactory = Composition.resolve()
        let vc = screenFactory.make(params: .init())
        viewController?.navigationController?.pushViewController(vc, animated: true)
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
