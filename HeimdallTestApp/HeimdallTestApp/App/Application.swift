import SwiftUI

class Application: ObservableObject {
    lazy var contentCoordinator = ContentCoordinator()
    
    @Published var state: AppState
    
    init() {
        self.state = .loggedOut
    }
    
    @ViewBuilder var contentView: some View {
        switch self.state {
        default:
            self.contentCoordinator.contentView
        }
    }
    
    enum AppState {
        case loggedIn
        case loggedOut
    }
}
