//
//  IsAnyUserSessionActiveUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import TemplateApplication

final class IsAnyUserSessionActiveUseCaseTests: XCTestCase {

    let customerRepository = CustomerRepositoryMock()
    lazy var sut = makeSUT()
    
    func makeSUT() -> DefaultIsAnyUserSessionActiveUseCase {
        DefaultIsAnyUserSessionActiveUseCase(
            customerRepository: customerRepository
        )
    }
    
    func testUseReturnsFalse() {
        // Arrange
        customerRepository.getCurrentCustomerCustomerReturnValue = nil
        
        // Act
        let result = sut.use()
        
        // Assert
        XCTAssertFalse(result)
    }
}
