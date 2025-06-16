//
//  ApplicationFlagRepository.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation

public protocol ApplicationActivityRepository {
    func getLaunchDate() -> Date?
    func saveLaunchDate(date: Date?)
    func getTerminationDate() -> Date?
    func saveTerminationDate(date: Date?)
}
