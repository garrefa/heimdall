import XCTest
@testable import HeimdallsWatch

final class HeimdallsWatchTests: XCTestCase {
    
    func testLoginHappyFlow() throws {
        Given("I am on the login page")
        doSomething()
        
        When("I enter my valid username and password")
        doSomething()
        
        When("I click the login button")
        doSomething()
        
        Then("I should be redirected to my account dashboard")
        doSomething()
        
        Tags(
            .team("Transformers"),
            .module("PIS"),
            .feature("ExternalPayment"),
            .info("HappyFlow")
        )
        
        XCTAssertTrue(true)
    }
    
    func doSomething() {}
}
