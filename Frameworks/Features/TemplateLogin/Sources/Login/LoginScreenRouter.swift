//
//  LoginScreenRouter.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 03/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import TemplateApplication
import DevToolsNavigation

public protocol LoginScreenRouter: ToErrorRouting {
    func routeToLoginCompleted(customer: Customer)
    func routeToLanguageSelectionScreen()
}
