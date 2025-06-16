//
//  FetchRemoteCustomersService.swift
//  AppName
//
//  Created by Hardijs Kirsis on 30/05/2025.
//  Copyright © 2025 AppName. All rights reserved.
//

import Combine
import ApplicationBusinessRules

public protocol FetchRemoteCustomersService {
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error>
}

public typealias FetchRemoteCustomersServiceOutput = [CustomerDTO]
