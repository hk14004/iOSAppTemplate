//
//  SplashVM.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
import Combine
import ApplicationBusinessRules

public protocol SplashScreenVM: SplashVMInput, SplashVMOutput {}

public protocol SplashVMInput {
    func onViewDidLoad()
}

public protocol SplashVMOutput {
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var router: SplashScreenRouter? { get set }
}

public class DefaultSplashVM: SplashScreenVM {
    // MARK: Properties
    public var router: SplashScreenRouter?
    public var isLoadingPublisher: AnyPublisher<Bool, Never> { $isLoading.eraseToAnyPublisher() }
    @Published private var isLoading: Bool = false
    
    // MARK: Lifecycle
    
    public init() {}
}

// MARK: Input

public extension DefaultSplashVM {
    func onViewDidLoad() {
        router?.routeToRoot()
    }
}
