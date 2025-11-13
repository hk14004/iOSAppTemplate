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
        container.register(AppDelegate.self) { resolver in
            UIApplication.shared.delegate as! AppDelegate
        }
        container.register((any AppDelegateRouter).self) { resolver in
            DefaultAppDelegateRouter()
        }
        
        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }
        container.register((any SimpleLoginScreenFactory).self) { resolver in
            DefaultSimpleLoginScreenFactory(
                di: Dependencies(
                    simpleLoginUseCase: Composition.resolve(),
                    getCurrentCustomerUseCase: Composition.resolve(),
                    toSplashScreenRouting: resolver.resolve(AppDelegateRouter.self)!
                )
            )
        }
        container.register((any LoggedInScreenFactory).self) { resolver in
            DefaultLoggedInScreenFactory(
                di: Dependencies(
                    simpleLoginUseCase: Composition.resolve(),
                    getCurrentCustomerUseCase: Composition.resolve(),
                    toSplashScreenRouting: resolver.resolve(AppDelegateRouter.self)!
                )
            )
        }
    }
}
