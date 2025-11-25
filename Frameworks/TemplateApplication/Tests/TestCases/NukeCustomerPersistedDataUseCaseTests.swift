//
//  NukeCustomerPersistedDataUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
import DevToolsXCTest
@testable import TemplateApplication

final class NukeCustomerPersistedDataUseCaseTests: XCTestCase {
    let customerRepository = CustomerRepositoryMock()
    let userSessionCredentialsRepository = UserSessionCredentialsRepositoryMock()
    lazy var sut = makeSUT()

    func makeSUT() -> DefaultNukeCustomerPersistedDataUseCase {
        DefaultNukeCustomerPersistedDataUseCase(
            customerRepository: customerRepository,
            userSessionCredentialsRepository: userSessionCredentialsRepository
        )
    }
    
    func testUseSucceeds() throws {
        // Arrange
        customerRepository.replaceWithItemsCustomerAnyPublisherVoidNeverReturnValue = .just(Void())
        // Act
        try awaitPublisher(sut.use(customerId: ""))
    }
}
