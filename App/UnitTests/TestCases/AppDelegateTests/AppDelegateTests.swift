import XCTest
@testable import Template

final class AppDelegateTests: XCTestCase {
    func makeSUT() -> AppDelegate {
        let delegate = AppDelegate()
        return delegate
    }
}
