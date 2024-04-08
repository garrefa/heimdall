import XCTest

extension XCTest {
    func Given<Result>(_ description: String,
                       file: StaticString = #file,
                       line: UInt = #line,
                       block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("[999] Given: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func When<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("[999] When: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func Then<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("[999] Then: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func Tags(_ tags: [Tag],
              file: StaticString = #file,
              line: UInt = #line) {
        BDD("[999] Tags: \(tags.map { $0.description }.joined(separator: ","))",
            file: file,
            line: line,
            block: { _ in })
    }
    
    private func BDD<Result>(_ description: String,
                             file: StaticString = #file,
                             line: UInt = #line,
                             block: (XCTActivity) throws -> Result) rethrows -> Result {
        try XCTContext.runActivity(named: description, block: block)
    }
}
