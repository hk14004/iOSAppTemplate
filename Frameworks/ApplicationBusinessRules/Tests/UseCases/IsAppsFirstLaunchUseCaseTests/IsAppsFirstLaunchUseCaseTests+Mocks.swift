//
//  IsAppsFirstLaunchUseCaseTests+Mocks.swift
//  ApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
@testable import ApplicationBusinessRules

extension IsAppsFirstLaunchUseCaseTests {
    final class Mocks {
        var mockApplicationActivityRepository = MockApplicationActivityRepository()
    }
}

extension IsAppsFirstLaunchUseCaseTests {
    func makeSUT() -> DefaultIsAppsFirstLaunchUseCase {
        DefaultIsAppsFirstLaunchUseCase(
            applicationActivityRepository: mocks.mockApplicationActivityRepository
        )
    }
}
