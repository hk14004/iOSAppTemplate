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
@testable import TemplateLogin

























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


public class GetCurrentCustomerUseCaseMock: GetCurrentCustomerUseCase {

    public init() {}



    //MARK: - use

    public var useCustomerCallsCount = 0
    public var useCustomerCalled: Bool {
        return useCustomerCallsCount > 0
    }
    public var useCustomerReturnValue: Customer?
    public var useCustomerClosure: (() -> Customer?)?

    public func use() -> Customer? {
        useCustomerCallsCount += 1
        if let useCustomerClosure = useCustomerClosure {
            return useCustomerClosure()
        } else {
            return useCustomerReturnValue
        }
    }


}


public class GetLastCustomerUseCaseMock: GetLastCustomerUseCase {

    public init() {}



    //MARK: - use

    public var useCustomerCallsCount = 0
    public var useCustomerCalled: Bool {
        return useCustomerCallsCount > 0
    }
    public var useCustomerReturnValue: Customer?
    public var useCustomerClosure: (() -> Customer?)?

    public func use() -> Customer? {
        useCustomerCallsCount += 1
        if let useCustomerClosure = useCustomerClosure {
            return useCustomerClosure()
        } else {
            return useCustomerReturnValue
        }
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


public class SplashScreenRouterMock: SplashScreenRouter {

    public init() {}

    public var simpleLoginScreenFactory: any SimpleLoginScreenFactory {
        get { return underlyingSimpleLoginScreenFactory }
        set(value) { underlyingSimpleLoginScreenFactory = value }
    }
    public var underlyingSimpleLoginScreenFactory: (any SimpleLoginScreenFactory)!


    //MARK: - routeToOnboarding

    public var routeToOnboardingVoidCallsCount = 0
    public var routeToOnboardingVoidCalled: Bool {
        return routeToOnboardingVoidCallsCount > 0
    }
    public var routeToOnboardingVoidClosure: (() -> Void)?

    public func routeToOnboarding() {
        routeToOnboardingVoidCallsCount += 1
        routeToOnboardingVoidClosure?()
    }

    //MARK: - routeToLoggedIn

    public var routeToLoggedInVoidCallsCount = 0
    public var routeToLoggedInVoidCalled: Bool {
        return routeToLoggedInVoidCallsCount > 0
    }
    public var routeToLoggedInVoidClosure: (() -> Void)?

    public func routeToLoggedIn() {
        routeToLoggedInVoidCallsCount += 1
        routeToLoggedInVoidClosure?()
    }

    //MARK: - routeToOkeyErrorAlert

    public var routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidCallsCount = 0
    public var routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidCalled: Bool {
        return routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidCallsCount > 0
    }
    public var routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidReceivedArguments: (error: Error, onDismiss: (() -> Void)?)?
    public var routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidReceivedInvocations: [(error: Error, onDismiss: (() -> Void)?)] = []
    public var routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidClosure: ((Error, (() -> Void)?) -> Void)?

    public func routeToOkeyErrorAlert(_ error: Error, onDismiss: (() -> Void)?) {
        routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidCallsCount += 1
        routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidReceivedArguments = (error: error, onDismiss: onDismiss)
        routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidReceivedInvocations.append((error: error, onDismiss: onDismiss))
        routeToOkeyErrorAlertErrorErrorOnDismissVoidVoidClosure?(error, onDismiss)
    }

    //MARK: - routeToSimpleLoginScreen

    public var routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidCallsCount = 0
    public var routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidCalled: Bool {
        return routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidCallsCount > 0
    }
    public var routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidReceivedParams: (SimpleLoginScreenFactoryParams)?
    public var routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidReceivedInvocations: [(SimpleLoginScreenFactoryParams)] = []
    public var routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidClosure: ((SimpleLoginScreenFactoryParams) -> Void)?

    public func routeToSimpleLoginScreen(params: SimpleLoginScreenFactoryParams) {
        routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidCallsCount += 1
        routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidReceivedParams = params
        routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidReceivedInvocations.append(params)
        routeToSimpleLoginScreenParamsSimpleLoginScreenFactoryParamsVoidClosure?(params)
    }


}

