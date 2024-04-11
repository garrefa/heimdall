import XCTest

// TODO: Use sourcery to auto generate

extension XCTest {
    public struct Tag {
        public enum TagType: String {
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
        
        public let value: String
        public let type: TagType
        
        public var description: String {
            "\(type.priority):\(type.rawValue):\(value)"
        }
    }
}

extension XCTest.Tag {
    
    public static func team(_ value: String) -> XCTest.Tag {
        XCTest.Tag(value: value, type: .team)
    }
    
    public static func module(_ value: String) -> XCTest.Tag {
        XCTest.Tag(value: value, type: .module)
    }
    
    public static func feature(_ value: String) -> XCTest.Tag {
        XCTest.Tag(value: value, type: .feature)
    }
    
    public static func info(_ value: String) -> XCTest.Tag {
        XCTest.Tag(value: value, type: .info)
    }
}

extension XCTest.Tag {
    // Teams
    public static let transformers = team("Transformers")
    public static let orangenators = team("Orangenators")
    
    // Modules
    public static let auth = module("Auth")
    public static let pis = module("PIS")
    
    // Features
    public static let login = feature("Login")
}
