//
//  SaveAppLaunchDateUseCaseTests.swift
//  SwedApplicationBusinessRulesTest
//
//  Created by Hardijs Ķirsis on 22/10/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import XCTest
@testable import TemplateApplication

final class SaveAppLaunchDateUseCaseTests: XCTestCase {

    let applicationActivityRepository = ApplicationActivityRepositoryMock()
    lazy var sut = makeSUT()

    func makeSUT() -> DefaultSaveAppLaunchDateUseCase {
        DefaultSaveAppLaunchDateUseCase(
            applicationActivityRepository: applicationActivityRepository
        )
    }
    
    func testUseSavesExpectedDate() {
        // Arrange
        let expectedLaunchDate = Date()
        
        // Act
        sut.use(launchDate: expectedLaunchDate)
        
        // Assert
        XCTAssertEqual(
            applicationActivityRepository.saveLaunchDateDateDateVoidReceivedDate,
            expectedLaunchDate
        )
    }
}
