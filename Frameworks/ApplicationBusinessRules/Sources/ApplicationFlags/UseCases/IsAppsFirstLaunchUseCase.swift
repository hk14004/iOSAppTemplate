//
//  isAppsFirstLaunchUseCase.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation

protocol IsAppsFirstLaunchUseCase {
    func use() -> Bool
}

struct DefaultIsAppsFirstLaunchUseCase: IsAppsFirstLaunchUseCase {
    
    private let applicationActivityRepository: ApplicationActivityRepository
    
    init(applicationActivityRepository: ApplicationActivityRepository) {
        self.applicationActivityRepository = applicationActivityRepository
    }
    
    func use() -> Bool {
        return applicationActivityRepository.getTerminationDate() == nil
    }
    
}
