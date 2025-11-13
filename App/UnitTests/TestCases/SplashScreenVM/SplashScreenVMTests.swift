//
//  SplashScreenVMTests.swift
//  App Unit Tests
//
//  Created by Hardijs on 13/11/2025.
//  Copyright © 2025 Template. All rights reserved.
//

import XCTest
@testable import Template

final class SplashScreenVMTests: XCTestCase {
    private let getLastCustomerUseCase = GetLastCustomerUseCaseMock()
    private let getCurrentCustomerUseCase = GetCurrentCustomerUseCaseMock()
    private let splashScreenRouter = SplashScreenRouterMock()
    private lazy var sut = makeSUT()
    
    private func makeSUT() -> SplashScreenVM {
        let vm = DefaultSplashVM(
            getLastCustomerUseCase: getLastCustomerUseCase,
            getCurrentCustomerUseCase: getCurrentCustomerUseCase
        )
        vm.router = splashScreenRouter
        return vm
    }

    func testViewDidLoad_CustomerExists() throws {
        // Arrange
        getLastCustomerUseCase.useCustomerReturnValue = .init(
            id: "",
            displayName: "",
            type: .private,
            hasIpRestriction: false,
            hasUsableAccounts: false,
            sortOrder: 0,
            roles: [],
            authorities: [],
            isMain: true
        )
        
        // Act
        sut.onViewDidLoad()
        
        // Assert
        XCTAssert(splashScreenRouter.routeToLoggedInVoidCalled)
    }
    
    func testViewDidLoad_CustomerNil() throws {
        // Arrange
        getLastCustomerUseCase.useCustomerReturnValue = nil
        
        // Act
        sut.onViewDidLoad()
        
        // Assert
        XCTAssert(splashScreenRouter.routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidCalled)
    }
}
