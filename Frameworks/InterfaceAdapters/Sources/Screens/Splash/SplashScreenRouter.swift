//
//  SplashScreenRouter.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 01/08/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
import ApplicationBusinessRules

public protocol SplashScreenRouter {
    func routeToRoot()
}

public protocol ToSplashScreenRouting {
    func routeToSplashScreen()
}
