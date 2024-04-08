// Define a struct to represent a target in the config file
struct Target: Codable {
    let name: String
    let path: String
    let tests: [String]
}