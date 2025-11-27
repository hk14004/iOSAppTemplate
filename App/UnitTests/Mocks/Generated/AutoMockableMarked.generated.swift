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


public class ApplicationActivityRepositoryMock: ApplicationActivityRepository {

    public init() {}



    //MARK: - getLaunchDate

    public var getLaunchDateDateCallsCount = 0
    public var getLaunchDateDateCalled: Bool {
        return getLaunchDateDateCallsCount > 0
    }
    public var getLaunchDateDateReturnValue: Date?
    public var getLaunchDateDateClosure: (() -> Date?)?

    public func getLaunchDate() -> Date? {
        getLaunchDateDateCallsCount += 1
        if let getLaunchDateDateClosure = getLaunchDateDateClosure {
            return getLaunchDateDateClosure()
        } else {
            return getLaunchDateDateReturnValue
        }
    }

    //MARK: - saveLaunchDate

    public var saveLaunchDateDateDateVoidCallsCount = 0
    public var saveLaunchDateDateDateVoidCalled: Bool {
        return saveLaunchDateDateDateVoidCallsCount > 0
    }
    public var saveLaunchDateDateDateVoidReceivedDate: (Date)?
    public var saveLaunchDateDateDateVoidReceivedInvocations: [(Date)?] = []
    public var saveLaunchDateDateDateVoidClosure: ((Date?) -> Void)?

    public func saveLaunchDate(date: Date?) {
        saveLaunchDateDateDateVoidCallsCount += 1
        saveLaunchDateDateDateVoidReceivedDate = date
        saveLaunchDateDateDateVoidReceivedInvocations.append(date)
        saveLaunchDateDateDateVoidClosure?(date)
    }

    //MARK: - getTerminationDate

    public var getTerminationDateDateCallsCount = 0
    public var getTerminationDateDateCalled: Bool {
        return getTerminationDateDateCallsCount > 0
    }
    public var getTerminationDateDateReturnValue: Date?
    public var getTerminationDateDateClosure: (() -> Date?)?

    public func getTerminationDate() -> Date? {
        getTerminationDateDateCallsCount += 1
        if let getTerminationDateDateClosure = getTerminationDateDateClosure {
            return getTerminationDateDateClosure()
        } else {
            return getTerminationDateDateReturnValue
        }
    }

    //MARK: - saveTerminationDate

    public var saveTerminationDateDateDateVoidCallsCount = 0
    public var saveTerminationDateDateDateVoidCalled: Bool {
        return saveTerminationDateDateDateVoidCallsCount > 0
    }
    public var saveTerminationDateDateDateVoidReceivedDate: (Date)?
    public var saveTerminationDateDateDateVoidReceivedInvocations: [(Date)?] = []
    public var saveTerminationDateDateDateVoidClosure: ((Date?) -> Void)?

    public func saveTerminationDate(date: Date?) {
        saveTerminationDateDateDateVoidCallsCount += 1
        saveTerminationDateDateDateVoidReceivedDate = date
        saveTerminationDateDateDateVoidReceivedInvocations.append(date)
        saveTerminationDateDateDateVoidClosure?(date)
    }


}


public class CustomerRepositoryMock: CustomerRepository {

    public init() {}



    //MARK: - replace

    public var replaceWithItemsCustomerAnyPublisherVoidErrorCallsCount = 0
    public var replaceWithItemsCustomerAnyPublisherVoidErrorCalled: Bool {
        return replaceWithItemsCustomerAnyPublisherVoidErrorCallsCount > 0
    }
    public var replaceWithItemsCustomerAnyPublisherVoidErrorReceivedItems: ([Customer])?
    public var replaceWithItemsCustomerAnyPublisherVoidErrorReceivedInvocations: [([Customer])] = []
    public var replaceWithItemsCustomerAnyPublisherVoidErrorReturnValue: AnyPublisher<Void, Error>!
    public var replaceWithItemsCustomerAnyPublisherVoidErrorClosure: (([Customer]) -> AnyPublisher<Void, Error>)?

    public func replace(with items: [Customer]) -> AnyPublisher<Void, Error> {
        replaceWithItemsCustomerAnyPublisherVoidErrorCallsCount += 1
        replaceWithItemsCustomerAnyPublisherVoidErrorReceivedItems = items
        replaceWithItemsCustomerAnyPublisherVoidErrorReceivedInvocations.append(items)
        if let replaceWithItemsCustomerAnyPublisherVoidErrorClosure = replaceWithItemsCustomerAnyPublisherVoidErrorClosure {
            return replaceWithItemsCustomerAnyPublisherVoidErrorClosure(items)
        } else {
            return replaceWithItemsCustomerAnyPublisherVoidErrorReturnValue
        }
    }

    //MARK: - addOrUpdate

    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverCallsCount = 0
    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverCalled: Bool {
        return addOrUpdateItemsCustomerAnyPublisherVoidNeverCallsCount > 0
    }
    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverReceivedItems: ([Customer])?
    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverReceivedInvocations: [([Customer])] = []
    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverReturnValue: AnyPublisher<Void, Never>!
    public var addOrUpdateItemsCustomerAnyPublisherVoidNeverClosure: (([Customer]) -> AnyPublisher<Void, Never>)?

    public func addOrUpdate(_ items: [Customer]) -> AnyPublisher<Void, Never> {
        addOrUpdateItemsCustomerAnyPublisherVoidNeverCallsCount += 1
        addOrUpdateItemsCustomerAnyPublisherVoidNeverReceivedItems = items
        addOrUpdateItemsCustomerAnyPublisherVoidNeverReceivedInvocations.append(items)
        if let addOrUpdateItemsCustomerAnyPublisherVoidNeverClosure = addOrUpdateItemsCustomerAnyPublisherVoidNeverClosure {
            return addOrUpdateItemsCustomerAnyPublisherVoidNeverClosure(items)
        } else {
            return addOrUpdateItemsCustomerAnyPublisherVoidNeverReturnValue
        }
    }

    //MARK: - getSingle

    public var getSingleIdStringAnyPublisherCustomerNeverCallsCount = 0
    public var getSingleIdStringAnyPublisherCustomerNeverCalled: Bool {
        return getSingleIdStringAnyPublisherCustomerNeverCallsCount > 0
    }
    public var getSingleIdStringAnyPublisherCustomerNeverReceivedId: (String)?
    public var getSingleIdStringAnyPublisherCustomerNeverReceivedInvocations: [(String)] = []
    public var getSingleIdStringAnyPublisherCustomerNeverReturnValue: AnyPublisher<Customer?, Never>!
    public var getSingleIdStringAnyPublisherCustomerNeverClosure: ((String) -> AnyPublisher<Customer?, Never>)?

    public func getSingle(id: String) -> AnyPublisher<Customer?, Never> {
        getSingleIdStringAnyPublisherCustomerNeverCallsCount += 1
        getSingleIdStringAnyPublisherCustomerNeverReceivedId = id
        getSingleIdStringAnyPublisherCustomerNeverReceivedInvocations.append(id)
        if let getSingleIdStringAnyPublisherCustomerNeverClosure = getSingleIdStringAnyPublisherCustomerNeverClosure {
            return getSingleIdStringAnyPublisherCustomerNeverClosure(id)
        } else {
            return getSingleIdStringAnyPublisherCustomerNeverReturnValue
        }
    }

    //MARK: - getSingle

    public var getSingleIdStringCustomerCallsCount = 0
    public var getSingleIdStringCustomerCalled: Bool {
        return getSingleIdStringCustomerCallsCount > 0
    }
    public var getSingleIdStringCustomerReceivedId: (String)?
    public var getSingleIdStringCustomerReceivedInvocations: [(String)] = []
    public var getSingleIdStringCustomerReturnValue: Customer?
    public var getSingleIdStringCustomerClosure: ((String) -> Customer?)?

    public func getSingle(id: String) -> Customer? {
        getSingleIdStringCustomerCallsCount += 1
        getSingleIdStringCustomerReceivedId = id
        getSingleIdStringCustomerReceivedInvocations.append(id)
        if let getSingleIdStringCustomerClosure = getSingleIdStringCustomerClosure {
            return getSingleIdStringCustomerClosure(id)
        } else {
            return getSingleIdStringCustomerReturnValue
        }
    }

    //MARK: - getRemoteCustomers

    public var getRemoteCustomersAnyPublisherCustomerErrorCallsCount = 0
    public var getRemoteCustomersAnyPublisherCustomerErrorCalled: Bool {
        return getRemoteCustomersAnyPublisherCustomerErrorCallsCount > 0
    }
    public var getRemoteCustomersAnyPublisherCustomerErrorReturnValue: AnyPublisher<[Customer], Error>!
    public var getRemoteCustomersAnyPublisherCustomerErrorClosure: (() -> AnyPublisher<[Customer], Error>)?

    public func getRemoteCustomers() -> AnyPublisher<[Customer], Error> {
        getRemoteCustomersAnyPublisherCustomerErrorCallsCount += 1
        if let getRemoteCustomersAnyPublisherCustomerErrorClosure = getRemoteCustomersAnyPublisherCustomerErrorClosure {
            return getRemoteCustomersAnyPublisherCustomerErrorClosure()
        } else {
            return getRemoteCustomersAnyPublisherCustomerErrorReturnValue
        }
    }

    //MARK: - getCurrentCustomer

    public var getCurrentCustomerCustomerCallsCount = 0
    public var getCurrentCustomerCustomerCalled: Bool {
        return getCurrentCustomerCustomerCallsCount > 0
    }
    public var getCurrentCustomerCustomerReturnValue: Customer?
    public var getCurrentCustomerCustomerClosure: (() -> Customer?)?

    public func getCurrentCustomer() -> Customer? {
        getCurrentCustomerCustomerCallsCount += 1
        if let getCurrentCustomerCustomerClosure = getCurrentCustomerCustomerClosure {
            return getCurrentCustomerCustomerClosure()
        } else {
            return getCurrentCustomerCustomerReturnValue
        }
    }

    //MARK: - setCurrentCustomer

    public var setCurrentCustomerCustomerCustomerVoidCallsCount = 0
    public var setCurrentCustomerCustomerCustomerVoidCalled: Bool {
        return setCurrentCustomerCustomerCustomerVoidCallsCount > 0
    }
    public var setCurrentCustomerCustomerCustomerVoidReceivedCustomer: (Customer)?
    public var setCurrentCustomerCustomerCustomerVoidReceivedInvocations: [(Customer)?] = []
    public var setCurrentCustomerCustomerCustomerVoidClosure: ((Customer?) -> Void)?

    public func setCurrentCustomer(_ customer: Customer?) {
        setCurrentCustomerCustomerCustomerVoidCallsCount += 1
        setCurrentCustomerCustomerCustomerVoidReceivedCustomer = customer
        setCurrentCustomerCustomerCustomerVoidReceivedInvocations.append(customer)
        setCurrentCustomerCustomerCustomerVoidClosure?(customer)
    }

    //MARK: - getLastUsedCustomer

    public var getLastUsedCustomerCustomerCallsCount = 0
    public var getLastUsedCustomerCustomerCalled: Bool {
        return getLastUsedCustomerCustomerCallsCount > 0
    }
    public var getLastUsedCustomerCustomerReturnValue: Customer?
    public var getLastUsedCustomerCustomerClosure: (() -> Customer?)?

    public func getLastUsedCustomer() -> Customer? {
        getLastUsedCustomerCustomerCallsCount += 1
        if let getLastUsedCustomerCustomerClosure = getLastUsedCustomerCustomerClosure {
            return getLastUsedCustomerCustomerClosure()
        } else {
            return getLastUsedCustomerCustomerReturnValue
        }
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


public class UserJourneyRepositoryMock: UserJourneyRepository {

    public init() {}



    //MARK: - update

    public var updateCompletedOnboardingBoolVoidCallsCount = 0
    public var updateCompletedOnboardingBoolVoidCalled: Bool {
        return updateCompletedOnboardingBoolVoidCallsCount > 0
    }
    public var updateCompletedOnboardingBoolVoidReceivedCompletedOnboarding: (Bool)?
    public var updateCompletedOnboardingBoolVoidReceivedInvocations: [(Bool)] = []
    public var updateCompletedOnboardingBoolVoidClosure: ((Bool) -> Void)?

    public func update(completedOnboarding: Bool) {
        updateCompletedOnboardingBoolVoidCallsCount += 1
        updateCompletedOnboardingBoolVoidReceivedCompletedOnboarding = completedOnboarding
        updateCompletedOnboardingBoolVoidReceivedInvocations.append(completedOnboarding)
        updateCompletedOnboardingBoolVoidClosure?(completedOnboarding)
    }

    //MARK: - getIsOnboardingCompleted

    public var getIsOnboardingCompletedBoolCallsCount = 0
    public var getIsOnboardingCompletedBoolCalled: Bool {
        return getIsOnboardingCompletedBoolCallsCount > 0
    }
    public var getIsOnboardingCompletedBoolReturnValue: Bool!
    public var getIsOnboardingCompletedBoolClosure: (() -> Bool)?

    public func getIsOnboardingCompleted() -> Bool {
        getIsOnboardingCompletedBoolCallsCount += 1
        if let getIsOnboardingCompletedBoolClosure = getIsOnboardingCompletedBoolClosure {
            return getIsOnboardingCompletedBoolClosure()
        } else {
            return getIsOnboardingCompletedBoolReturnValue
        }
    }


}


public class UserSessionCredentialsRepositoryMock: UserSessionCredentialsRepository {

    public init() {}



    //MARK: - save

    public var saveCredentialsUserSessionCredentialsVoidCallsCount = 0
    public var saveCredentialsUserSessionCredentialsVoidCalled: Bool {
        return saveCredentialsUserSessionCredentialsVoidCallsCount > 0
    }
    public var saveCredentialsUserSessionCredentialsVoidReceivedCredentials: (UserSessionCredentials)?
    public var saveCredentialsUserSessionCredentialsVoidReceivedInvocations: [(UserSessionCredentials)] = []
    public var saveCredentialsUserSessionCredentialsVoidClosure: ((UserSessionCredentials) -> Void)?

    public func save(credentials: UserSessionCredentials) {
        saveCredentialsUserSessionCredentialsVoidCallsCount += 1
        saveCredentialsUserSessionCredentialsVoidReceivedCredentials = credentials
        saveCredentialsUserSessionCredentialsVoidReceivedInvocations.append(credentials)
        saveCredentialsUserSessionCredentialsVoidClosure?(credentials)
    }

    //MARK: - getCredentials

    public var getCredentialsIdStringUserSessionCredentialsCallsCount = 0
    public var getCredentialsIdStringUserSessionCredentialsCalled: Bool {
        return getCredentialsIdStringUserSessionCredentialsCallsCount > 0
    }
    public var getCredentialsIdStringUserSessionCredentialsReceivedId: (String)?
    public var getCredentialsIdStringUserSessionCredentialsReceivedInvocations: [(String)] = []
    public var getCredentialsIdStringUserSessionCredentialsReturnValue: UserSessionCredentials?
    public var getCredentialsIdStringUserSessionCredentialsClosure: ((String) -> UserSessionCredentials?)?

    public func getCredentials(id: String) -> UserSessionCredentials? {
        getCredentialsIdStringUserSessionCredentialsCallsCount += 1
        getCredentialsIdStringUserSessionCredentialsReceivedId = id
        getCredentialsIdStringUserSessionCredentialsReceivedInvocations.append(id)
        if let getCredentialsIdStringUserSessionCredentialsClosure = getCredentialsIdStringUserSessionCredentialsClosure {
            return getCredentialsIdStringUserSessionCredentialsClosure(id)
        } else {
            return getCredentialsIdStringUserSessionCredentialsReturnValue
        }
    }

    //MARK: - deleteCredentials

    public var deleteCredentialsIdStringVoidCallsCount = 0
    public var deleteCredentialsIdStringVoidCalled: Bool {
        return deleteCredentialsIdStringVoidCallsCount > 0
    }
    public var deleteCredentialsIdStringVoidReceivedId: (String)?
    public var deleteCredentialsIdStringVoidReceivedInvocations: [(String)] = []
    public var deleteCredentialsIdStringVoidClosure: ((String) -> Void)?

    public func deleteCredentials(id: String) {
        deleteCredentialsIdStringVoidCallsCount += 1
        deleteCredentialsIdStringVoidReceivedId = id
        deleteCredentialsIdStringVoidReceivedInvocations.append(id)
        deleteCredentialsIdStringVoidClosure?(id)
    }


}

