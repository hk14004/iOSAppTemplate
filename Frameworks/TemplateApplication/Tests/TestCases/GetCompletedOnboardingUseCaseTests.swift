//
//  GetCompletedOnboardingUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import TemplateApplication

final class GetCompletedOnboardingUseCaseTests: XCTestCase {
    let userJourneyRepository = UserJourneyRepositoryMock()
    lazy var sut = makeSUT()
    
    func makeSUT() -> DefaultIsOnboardingCompletedUseCase {
        DefaultIsOnboardingCompletedUseCase(
            userJourneyRepository: userJourneyRepository
        )
    }
    
    func testUseReturnsTrue() {
        // Arrange
        userJourneyRepository.getIsOnboardingCompletedBoolReturnValue = true
        
        // Act
        let result = sut.use()
        
        // Assert
        XCTAssertTrue(result)
    }
}
