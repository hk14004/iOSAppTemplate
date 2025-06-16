//
//  DefaultApplicationActivityRepository.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import ApplicationBusinessRules

class DefaultApplicationActivityRepository: ApplicationActivityRepository {
    private let defaultsStore: DefaultsAdapter<DefaultsKeys>
    
    init(defaultsStore: UserDefaults = UserDefaults.standard) {
        self.defaultsStore = DefaultsAdapter<DefaultsKeys>(
            defaults: defaultsStore,
            keyStore: .init()
        )
    }
    
    func getLaunchDate() -> Date? {
        defaultsStore[\.appLaunchDate]
    }
    
    func saveLaunchDate(date: Date?) {
        defaultsStore[\.appLaunchDate] = date
    }
    
    func getTerminationDate() -> Date? {
        defaultsStore[\.appTerminationDate]
    }
    
    func saveTerminationDate(date: Date?) {
        defaultsStore[\.appTerminationDate] = date
    }
}
