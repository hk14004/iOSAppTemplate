import XCTest
@testable import Template

extension AppDelegateTests {
    func testAppLaunch_didRegisterStartup() {
        // Arrange
        let expectedDate = Date()

        // Act
        let _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        
        // Assert
        let distance = expectedDate.distance(to: saveAppLaunchDateUseCaseMock.useLaunchDateDateVoidReceivedLaunchDate!)
        XCTAssertTrue(distance < 1)
    }
    
    func testAppTerminate_didRegisterTermination() {
        // Arrange
        let expectedDate = Date()
        
        // Act
        sut.applicationWillTerminate(UIApplication.shared)
        
        // Assert
        let distance = expectedDate.distance(to: saveAppTerminationDateUseCaseMock.useTerminationDateDateVoidReceivedTerminationDate!)
        XCTAssertTrue(distance < 1)
    }
    
    func testAppLaunch_didCallRouteToSplash() {
        // Act
        let _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
        
        // Assert
        XCTAssertTrue(appDelegateRouter.routeToSplashScreenVoidCalled)
    }
}
