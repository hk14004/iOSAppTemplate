import Foundation
import Swinject
import DevToolsCore
import TemplateApplication

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(GetLastCustomerUseCase.self) { resolver in
            DefaultGetLastCustomerUseCase(customerRepository: Composition.resolve())
        }
        container.register(PinAuthenticateUseCase.self) { resolver in
            DefaultPinAuthenticateUseCase()
        }
        container.register(BiometryAuthenticateUseCase.self) { resolver in
            DefaultBiometryAuthenticateUseCase()
        }
        container.register(isOnboardingCompletedUseCase.self) { resolver in
            DefaultIsOnboardingCompletedUseCase(
                userJourneyRepository: Composition.resolve()
            )
        }
        container.register(SaveAppLaunchDateUseCase.self) { resolver in
            DefaultSaveAppLaunchDateUseCase(
                applicationActivityRepository: Composition.resolve()
            )
        }
        container.register(SaveAppTerminationDateUseCase.self) { resolver in
            DefaultSaveAppTerminationDateUseCase(
                applicationActivityRepository: Composition.resolve()
            )
        }
        container.register(IsAnyUserSessionActiveUseCase.self) { resolver in
            DefaultIsAnyUserSessionActiveUseCase(
                customerRepository: Composition.resolve()
            )
        }
        container.register(GetCurrentLanguageUseCase.self) { resolver in
            DefaultGetCurrentLanguageUseCase(languageRepository: Composition.resolve())
        }
        container.register(GetAvailableLanguagesUseCase.self) { resolver in
            DefaultGetAvailableLanguagesUseCase(languageRepository: Composition.resolve())
        }
        container.register(SetCurrentLanguagesUseCase.self) { resolver in
            DefaultSetCurrentLanguagesUseCase(languageRepository: Composition.resolve())
        }
        container.register(GetCurrentCustomerUseCase.self) { resolver in
            DefaultGetCurrentCustomerUseCase(
                customerRepository: Composition.resolve()
            )
        }
        container.register(NukeCustomerPersistedDataUseCase.self) { resolver in
            DefaultNukeCustomerPersistedDataUseCase(
                customerRepository: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve()
            )
        }
        container.register(LogoutUseCase.self) { resolver in
            DefaultLogoutUseCase(
                customerRepository: Composition.resolve(),
                nukeCustomerPersistedDataUseCase: Composition.resolve()
            )
        }
        container.register(SimpleLoginUseCase.self) { resolver in
            DefaultSimpleLoginUseCase(
                customerRepository: Composition.resolve(),
                startSessionService: Composition.resolve(),
                userSessionCredentialsRepository: Composition.resolve()
            )
        }
    }
}
