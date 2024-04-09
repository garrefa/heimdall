import XCTest

final class LoginFlowTests: XCTestCase {
    
    /*
     GIVEN:
     - There is a user logged in
     WHEN:
     - User opens the app
     THEN:
     - Shortcuts are registered
     - Shortcuts are registered a second time
     #team:Transformers #module:PIS #happyflow
     */
    func testLoginHappyFlow() throws {
        prepareScenario(.paymentInitiationService_BE)
        enrollAndLogin(customerType: .retail)
        try openTransferFlow()
        tapContinueTransferAlert()
        startTransfer()
        confirmTransfer()
    }
    
    /*
     GIVEN:
     - There is a user logged in
     THEN:
     - Shortcuts are registered
     #team:Oranginators #module:Onboarding #sadflow
     */
    func testTransferFlow_forCombiUser() throws {
        prepareScenario(.paymentInitiationService_BE)
        enrollAndLogin(customerType: .combi)
        try openTransferFlow()
        tapContinueTransferAlert()
        selectProfessionalProfile()
        startTransfer()
        confirmTransfer()
    }
    
    /*
     GIVEN:
     - There is a user logged in
     THEN:
     - Shortcuts are registered
     */
    func testTransferFlow_forCombiUser2() throws {
    }
    
    func testTransferFlow_forCombiUser3() throws {
    }
    
    /*
     GIVEN:
     - No function is found after this
     WHEN:
     THEN:
     - This block is discarded.
     */
}
