import ArgumentParser

@main
struct HeimdallParser: ParsableCommand {
    @Option(name: .shortAndLong, help: "The path for the config.yml file.")
    var config: String?

    mutating func run() throws {
        // If no argument is provided, assume the config file is in the current directory
        let configPath = config ?? "./config.yml"

        print("👷 Parsing config.yml")
        // Parse the config file at the specified path
        guard let _ = ConfigYMLParser.parseYML(at: configPath) else {
            // If parsing fails, print an error message
            print("🔴 Failed to parse config file.")
            return
        }

        print("✅ Config parsed with success.")
    }
}
