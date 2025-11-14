//
//  IsAppsFirstLaunchUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import TemplateApplication

final class IsAppsFirstLaunchUseCaseTests: XCTestCase {
    
    let applicationActivityRepository = ApplicationActivityRepositoryMock()
    lazy var sut = makeSUT()
    
    func makeSUT() -> DefaultIsAppsFirstLaunchUseCase {
        DefaultIsAppsFirstLaunchUseCase(
            applicationActivityRepository: applicationActivityRepository
        )
    }
    func testUseReturnsTrue() {
        // Arrange
        applicationActivityRepository.getTerminationDateDateReturnValue = nil
        
        // Act
        let result = sut.use()
        
        // Assert
        XCTAssertTrue(result)
    }
}
