//
//  FetchRemoteAccountsService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine
import TemplateApplication

public protocol FetchRemoteAccountsService {
    func use() -> AnyPublisher<FetchRemoteAccountsServiceOutput, Error>
}

public typealias FetchRemoteAccountsServiceOutput = [Account]
