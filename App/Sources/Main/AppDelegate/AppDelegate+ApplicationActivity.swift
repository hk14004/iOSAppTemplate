//
//  AppDelegate+ApplicationActivity.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import TemplateApplication

extension AppDelegate {
    func registerApplicationLaunch() {
        let saveAppLaunchDateUseCase = container.resolve(SaveAppLaunchDateUseCase.self)!
        saveAppLaunchDateUseCase.use(launchDate: Date())
    }
    func registerApplicationTermination() {
        let saveAppTerminationDateUseCase = container.resolve(SaveAppTerminationDateUseCase.self)!
        saveAppTerminationDateUseCase.use(terminationDate: Date())
    }
}
