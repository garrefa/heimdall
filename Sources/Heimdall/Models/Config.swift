// Define a struct to represent the entire config file
struct Config: Codable {
    let targets: [Target]
}
