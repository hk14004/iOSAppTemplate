//
//  SplashScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import TemplateApplication
import DevToolsNavigation
import TemplateLogin

public protocol SplashScreenRouter: ToRootTabbarScreenRouting, ToErrorRouting, ToSimpleLoginScreenRouting {
    func routeToOnboarding()
}

public protocol ToSplashScreenRouting {
    func routeToSplashScreen()
}
