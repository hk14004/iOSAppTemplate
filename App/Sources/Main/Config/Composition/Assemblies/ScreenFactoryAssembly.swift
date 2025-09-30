import Swinject
import TemplateApplication
import DevToolsNavigation
import UIKit
import SwiftUI
import TemplateLogin

class ScreenFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIWindow.self) { resolver in
            UIWindow(frame: UIScreen.main.bounds)
        }.inObjectScope(.container)
        // MARK: Splash
        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }
        // MARK: Login
        container.register((any LoginScreenFactory).self) { resolver in
            DefaultLoginScreenFactory(di: Dependencies(
                simpleLoginUseCase: Composition.resolve(),
                getCurrentCustomerUseCase: Composition.resolve(),
                pinAuthenticateUseCase: Composition.resolve(),
                getLastCustomerUseCase: Composition.resolve(),
                biometryAuthenticateUseCase: Composition.resolve())
            )
        }
        container.register((any SimpleLoginScreenFactory).self) { resolver in
            DefaultSimpleLoginScreenFactory(di: Dependencies(
                simpleLoginUseCase: Composition.resolve(),
                getCurrentCustomerUseCase: Composition.resolve(),
                pinAuthenticateUseCase: Composition.resolve(),
                getLastCustomerUseCase: Composition.resolve(),
                biometryAuthenticateUseCase: Composition.resolve()
            )
            )
        }
    }
}
