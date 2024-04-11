import XCTest

/*
 SQLite Queries:
 ---------------------------------------------------------------
 SELECT testCaseRun_fk, orderInParent, failureIDs, title
 FROM "Activities"
 WHERE testCaseRun_fk IS NOT NULL AND title LIKE '[999]%';
 
 ---------------------------------------------------------------
 SELECT testSuiteRun_fk, testCase_fk, result FROM "TestCaseRuns"

 ---------------------------------------------------------------
 SELECT testSuite_fk, name FROM "TestCases"
 */

final class BitsoGalleryUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
    }

    func testLoginHappyCase() throws {
        Given("App started") { _ in
            let app = XCUIApplication()
            app.launch()
        }
        When("User is logged in") { _ in
            print("[999] logged in")
        }
        Then("Check if access is granted") { _ in
            XCTAssertEqual("[999] Test Passed",
                           "[999] Test Passed")
        }
        Tags([
            .transformers,
            .auth,
            .login,
            .info("HappyCase")
        ])
    }
    
    func testLoginUnhappyCase() throws {
        Given("App started") { _ in
            let app = XCUIApplication()
            app.launch()
        }
        When("User is logged in") { _ in
            print("[999] logged in")
        }
        Then("Check if access is granted") { _ in
            XCTFail("[999] Test failed!")
        }
        Tags([
            .transformers,
            .pis,
            .login,
            .info("UnhappyCase")
        ])
    }
}
