import XCTest
import Swinject
@testable import Template
@testable import TemplateApplication

final class AppDelegateTests: XCTestCase {
    let container = Container()
    lazy var sut = makeSUT()
    let saveAppLaunchDateUseCaseMock = SaveAppLaunchDateUseCaseMock()
    let saveAppTerminationDateUseCaseMock = SaveAppTerminationDateUseCaseMock()
    let appDelegateRouter = AppDelegateRouterMock()
    
    override func setUpWithError() throws {
        container.register(SaveAppLaunchDateUseCase.self) { resolver in
            self.saveAppLaunchDateUseCaseMock
        }
        container.register(SaveAppTerminationDateUseCase.self) { resolver in
            self.saveAppTerminationDateUseCaseMock
        }
        container.register(AppDelegateRouter.self) { resolver in
            self.appDelegateRouter
        }
    }
    
    func makeSUT() -> AppDelegate {
        let delegate = AppDelegate()
        delegate.container = container
        return delegate
    }
}
