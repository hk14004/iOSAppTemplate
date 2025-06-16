import Foundation
import Swinject
import DevToolsCore
import ApplicationBusinessRules

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchRemoteCustomersService.self) { resolver in
            GithubFetchRemoteCustomersService(networkClient: Composition.resolve())
        }
        .inObjectScope(.container)
    }
}
