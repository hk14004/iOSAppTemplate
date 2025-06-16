import Foundation
import DevToolsCoreData
import Swinject
import DevToolsCore
import ApplicationBusinessRules

class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ApplicationActivityRepository.self) { resolver in
            DefaultApplicationActivityRepository()
        }
        .inObjectScope(.container)
        container.register(CustomerRepository.self) { resolver in
            DefaultCustomerRepository(
                fetchRemoteCustomersService: Composition.resolve(),
                localStore: resolver.resolve(PersistentCoreDataStore<CustomerDTO>.self)!
            )
        }
        .inObjectScope(.container)
    }
}
