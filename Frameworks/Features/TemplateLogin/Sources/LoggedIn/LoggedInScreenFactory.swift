//
//  DefaultSimpleLoginScreenFactory.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 16/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import TemplateApplication
import DevToolsNavigation
import UIKit
import Combine

public protocol LoggedInScreenFactory: UIKitScreenFactory where Params == LoggedInScreenFactoryParams {}

public struct LoggedInScreenFactoryParams {
    public init() {}
}

public class DefaultLoggedInScreenFactory: LoggedInScreenFactory {
    let di: Dependencies
    var getCurrentCustomerUseCase: GetCurrentCustomerUseCase { di.getCurrentCustomerUseCase }
    var toSplashScreenRouting: ToSplashScreenRouting { di.toSplashScreenRouting }
    
    public init(di: Dependencies) {
        self.di = di
    }
    
    public func make(params: LoggedInScreenFactoryParams) -> UIViewController {
        guard let customer = getCurrentCustomerUseCase.use() else {
            toSplashScreenRouting.routeToSplashScreen()
            return .init()
        }
        
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        print("Hello, \(customer.displayName)")
        return vc
    }
}
