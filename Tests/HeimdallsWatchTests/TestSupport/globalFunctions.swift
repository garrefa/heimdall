import Foundation

func Given(_ description: String,
           file: String = #file,
           function: String = #function,
           line: Int = #line
) {
    BDDFunc(step: "Given",
            description: description,
            file: file,
            function: function,
            line: line)
}

func When(_ description: String,
           file: String = #file,
           function: String = #function,
           line: Int = #line
) {
    BDDFunc(step: "When",
            description: description,
            file: file,
            function: function,
            line: line)
}

func Then(_ description: String,
           file: String = #file,
           function: String = #function,
           line: Int = #line
) {
    BDDFunc(step: "Then",
            description: description,
            file: file,
            function: function,
            line: line)
}

private func BDDFunc(step: String,
                     description: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line
) {
    print(step, description, file, function, line, separator: " =|= ", terminator: "\n")
}

enum Tag: CustomStringConvertible {
    case project(_ name: String)
    case team(_ name: String)
    case module(_ name: String)
    case feature(_ name: String)
    case info(_ name: String)
    
    var description: String {
        switch self {
        case .project(let name):
            return "\(priority):project:\(name)"
        case .team(let name):
            return "\(priority):team:\(name)"
        case .module(let name):
            return "\(priority):module:\(name)"
        case .feature(let name):
            return "\(priority):feature:\(name)"
        case .info(let name):
            return "\(priority):info:\(name)"
        }
    }
    
    var priority: Int {
        switch self {
        case .project:
            return 0
        case .team:
            return 1
        case .module:
            return 2
        case .feature:
            return 3
        case .info:
            return 99
        }
    }
}

func Tags(_ tagList: Tag...,
          file: String = #file,
          function: String = #function,
          line: Int = #line
) {
    let tags: [String] = tagList.map { $0.description }
    print("Tags:", tags, file, function, line, separator: " =|= ", terminator: "\n")
}
