import Foundation
import Swinject
import DevToolsCore
import ApplicationBusinessRules

class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StartAllUserSessionsUseCase.self) { resolver in
            DefaultStartAllUserSessionsUseCase(
                manager: Composition.resolve()
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
                userSessionManager: Composition.resolve()
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
                userSessionManager: Composition.resolve(),
                customerRepository: Composition.resolve()
            )
        }
    }
}
