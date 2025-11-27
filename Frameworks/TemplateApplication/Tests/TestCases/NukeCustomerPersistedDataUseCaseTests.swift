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
        customerRepository.replaceWithItemsCustomerAnyPublisherVoidErrorReturnValue = .just(Void())
        // Act
        let result: Void? = try awaitPublisher(sut.use(customerId: ""))?.get()
        
        // Assert
        try XCTUnwrap(result)
    }
    
    func testUseFails() throws {
        // Arrange
        customerRepository.replaceWithItemsCustomerAnyPublisherVoidErrorReturnValue = .fail(mockedError)
        
        // Act
        let result = awaitPublisher(sut.use(customerId: ""))
        
        // Assert
        XCTAssertEqual(mockedError, result?.error as? MockError)
    }
}
