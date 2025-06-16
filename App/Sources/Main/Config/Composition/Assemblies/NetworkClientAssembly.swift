import Foundation
import Swinject
import DevToolsCore
import DevToolsNetworking
import ApplicationBusinessRules

class NetworkClientAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DevNetworkRequestFactory.self) { resolver in
            DefaultNetworkRequestFactory()
        }
        .inObjectScope(.container)
        container.register(DevNetworkDataProvider.self) { resolver in
            DefaultNetworkDataProvider()
        }
        .inObjectScope(.container)
        container.register(AppsNetworkClient.self) { resolver in
            AppsNetworkClient(
                dataProvider: resolver.resolve(DevNetworkDataProvider.self)!,
                requestFactory: resolver.resolve(DevNetworkRequestFactory.self)!
            )
        }
        .inObjectScope(.container)
    }
}
