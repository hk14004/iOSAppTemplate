// Generated using Sourcery 2.3.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif

import Combine

@testable import Template
@testable import TemplateApplication

























class AppDelegateRouterMock: AppDelegateRouter {




    //MARK: - routeToSplashScreen

    public var routeToSplashScreenVoidCallsCount = 0
    public var routeToSplashScreenVoidCalled: Bool {
        return routeToSplashScreenVoidCallsCount > 0
    }
    public var routeToSplashScreenVoidClosure: (() -> Void)?

    public func routeToSplashScreen() {
        routeToSplashScreenVoidCallsCount += 1
        routeToSplashScreenVoidClosure?()
    }


}


public class SaveAppLaunchDateUseCaseMock: SaveAppLaunchDateUseCase {

    public init() {}



    //MARK: - use

    public var useLaunchDateDateVoidCallsCount = 0
    public var useLaunchDateDateVoidCalled: Bool {
        return useLaunchDateDateVoidCallsCount > 0
    }
    public var useLaunchDateDateVoidReceivedLaunchDate: (Date)?
    public var useLaunchDateDateVoidReceivedInvocations: [(Date)?] = []
    public var useLaunchDateDateVoidClosure: ((Date?) -> Void)?

    public func use(launchDate: Date?) {
        useLaunchDateDateVoidCallsCount += 1
        useLaunchDateDateVoidReceivedLaunchDate = launchDate
        useLaunchDateDateVoidReceivedInvocations.append(launchDate)
        useLaunchDateDateVoidClosure?(launchDate)
    }


}


public class SaveAppTerminationDateUseCaseMock: SaveAppTerminationDateUseCase {

    public init() {}



    //MARK: - use

    public var useTerminationDateDateVoidCallsCount = 0
    public var useTerminationDateDateVoidCalled: Bool {
        return useTerminationDateDateVoidCallsCount > 0
    }
    public var useTerminationDateDateVoidReceivedTerminationDate: (Date)?
    public var useTerminationDateDateVoidReceivedInvocations: [(Date)?] = []
    public var useTerminationDateDateVoidClosure: ((Date?) -> Void)?

    public func use(terminationDate: Date?) {
        useTerminationDateDateVoidCallsCount += 1
        useTerminationDateDateVoidReceivedTerminationDate = terminationDate
        useTerminationDateDateVoidReceivedInvocations.append(terminationDate)
        useTerminationDateDateVoidClosure?(terminationDate)
    }


}

