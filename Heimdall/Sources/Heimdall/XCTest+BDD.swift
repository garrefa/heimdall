import XCTest

/*
 TODO: Use sourcery to auto generate
 TODO: Given amd Then should accept list items [*] to avoid Ands
 TODO: Validate the order and completeness of the calls
 TODO: Support BDD Feature, Background, Scenario definitions
    - for Feature and Background, one option is to expect a function feature() and background()
    to be defined in the TestCase and expected to return a description and a list of aditional
    strings as a list of especifications.
 TODO: Add configuration to allow:
    - toggling validation on/off
    - defining if Feature, Background, Scenario definitions are mandatory
 */

public extension XCTest {
    static let bddPrefix = "999"
    
    func Given<Result>(_ description: String,
                       file: StaticString = #file,
                       line: UInt = #line,
                       block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("Given: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func When<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("When: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func Then<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("Then: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func And<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("And: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func But<Result>(_ description: String,
                      file: StaticString = #file,
                      line: UInt = #line,
                      block: (XCTActivity) throws -> Result) rethrows -> Result {
        try BDD("But: \(description)",
                file: file,
                line: line,
                block: block)
    }
    
    func Tags(_ tags: [Tag],
              file: StaticString = #file,
              line: UInt = #line) {
        BDD("Tags: \(tags.map { $0.description }.joined(separator: ","))",
            file: file,
            line: line,
            block: { _ in })
    }
    
    private func BDD<Result>(_ description: String,
                             file: StaticString = #file,
                             line: UInt = #line,
                             block: (XCTActivity) throws -> Result) rethrows -> Result {
        try XCTContext.runActivity(named: "[\(Self.bddPrefix)] \(description)", block: block)
    }
}
