//
//  SplashScreenFactory.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 15/12/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import UIKit
import InterfaceAdapters
import DevToolsUI

protocol SplashScreenFactory {
    func make() -> SplashScreenVC
}

class DefaultSplashScreenFactory: SplashScreenFactory {
    func make() -> SplashScreenVC {
        let vm = DefaultSplashVM()
        let vc = SplashScreenVC(viewModel: vm)
        let router = DefaultSplashScreenRouter(viewController: vc)
        vm.router = router
        return vc
    }
}
