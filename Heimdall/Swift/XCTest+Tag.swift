import XCTest

extension XCTest {
    struct Tag {
        enum TagType: String {
            case team
            case module
            case feature
            case info
            
            var priority: Int {
                switch self {
                case .team:
                    return 0
                case .module:
                    return 1
                case .feature:
                    return 2
                case .info:
                    return 100
                }
            }
        }
        
        let value: String
        let type: TagType
        
        var description: String {
            "\(type.priority):\(type.rawValue):\(value)"
        }
    }
}

extension XCTest.Tag {
    typealias Tag = XCTest.Tag
    
    // Teams
    static let transformers = Tag(value: "Transformers", type: .team)
    static let orangenators = Tag(value: "Orangenators", type: .team)
    
    // Modules
    static let auth = Tag(value: "Auth", type: .module)
    static let pis = Tag(value: "PIS", type: .module)
    
    // Features
    static let login = Tag(value: "Login", type: .feature)
    
    // Info
    static func info(_ value: String) -> Tag {
        Tag(value: value, type: .info)
    }
}
