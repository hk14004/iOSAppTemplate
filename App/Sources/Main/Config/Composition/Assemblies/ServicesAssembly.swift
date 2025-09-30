import Foundation
import Swinject
import DevToolsCore
import TemplateApplication
import TemplateEnterprise
import TemplateNetwork

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(StartSessionService.self) { resolver in
            DefaultStartSessionService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
        container.register(FetchRemoteCustomersService.self) { resolver in
            GithubFetchRemoteCustomersService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
    }
}
