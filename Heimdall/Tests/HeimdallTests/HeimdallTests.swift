import XCTest
@testable import Heimdall

final class HeimdallTests: XCTestCase {
    
    func testBart() throws {
        doSomething()
    }
    
    func testLoginHappyFlow() throws {
        Given("I am on the login page") { _ in
            doSomething()
        }
        
        When("I enter my valid username and password") { _ in
            doSomething()
        }
        
        When("I click the login button") { _ in
            doSomething()
        }
        
        Then("I should be redirected to my account dashboard") { _ in
            doSomething()
        }
        
        Tags([.transformers, .pis, .feature("ExternalPayment"), .info("happy-flow")])
        
        XCTAssertTrue(true)
    }
    
    func doSomething() {}
}
