//
//  GetCurrentCustomerUseCase.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 02/09/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import Foundation
import Combine

public protocol NukeCustomerPersistedDataUseCase {
    func use(customerId: String) -> AnyPublisher<Void, Error>
}

public struct DefaultNukeCustomerPersistedDataUseCase: NukeCustomerPersistedDataUseCase {
    private let customerRepository: CustomerRepository
    private let userSessionCredentialsRepository: UserSessionCredentialsRepository
    
    public init(
        customerRepository: CustomerRepository,
        userSessionCredentialsRepository: UserSessionCredentialsRepository
    ) {
        self.customerRepository = customerRepository
        self.userSessionCredentialsRepository = userSessionCredentialsRepository
    }
    
    public func use(customerId: String) -> AnyPublisher<Void, Error> {
        customerRepository.replace(with: [])
            .map { _ in
                userSessionCredentialsRepository.deleteCredentials(id: customerId)
            }
            .eraseToAnyPublisher()
    }
}
