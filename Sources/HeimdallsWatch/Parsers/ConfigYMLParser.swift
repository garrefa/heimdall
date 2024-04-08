import Foundation
import Yams

struct ConfigYMLParser {
    // Function to parse the config file at the given path
    static func parseYML(at path: String) -> Config? {
        do {
            // Create a URL from the file path
            let fileURL = URL(fileURLWithPath: path)

            // Read the contents of the file as a string
            let yamlString = try String(contentsOf: fileURL, encoding: .utf8)

            // Decode the YAML string into a Config object using YAMLDecoder
            let config = try YAMLDecoder().decode(Config.self, from: yamlString)

            // Return the parsed Config object
            return config
        } catch {
            // If an error occurs during parsing, print the error and return nil
            print("🧨 Error parsing config file: \(error)")
            return nil
        }
    }
}
