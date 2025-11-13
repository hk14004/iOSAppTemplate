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

// sourcery: AutoMockable, marker=App
public protocol SplashScreenRouter: ToErrorRouting, ToSimpleLoginScreenRouting {
    func routeToOnboarding()
    func routeToLoggedIn()
}
