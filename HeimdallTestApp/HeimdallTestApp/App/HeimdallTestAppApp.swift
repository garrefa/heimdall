import SwiftUI

@main
struct HeimdallTestAppApp: App {
    @StateObject var app: Application
    
    init() {
        let app = Application()
        self._app = StateObject(wrappedValue: app)
    }
    
    var body: some Scene {
        WindowGroup {
            self.app.contentView
        }
    }
}
