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

        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }

        container.register((any SimpleLoginScreenFactory).self) { resolver in
            DefaultSimpleLoginScreenFactory(
                di: Dependencies(simpleLoginUseCase: Composition.resolve())
            )
        }
    }
}
