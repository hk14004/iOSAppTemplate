import Swinject
import ApplicationBusinessRules
import InterfaceAdapters
import DevToolsNavigation
import UIKit
import SwiftUI

class ScreenFactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIWindow.self) { resolver in
            UIWindow(frame: UIScreen.main.bounds)
        }.inObjectScope(.container)
        // MARK: Splash
        container.register(SplashScreenFactory.self) { resolver in
            DefaultSplashScreenFactory()
        }
    }
}
