import SwiftUI

public final class ContentCoordinator: ObservableObject, ViewCoordinator {
    
    lazy var startCoordinator = LoginScene.Coordinator()
    
    @ViewBuilder
    public var contentView: some View {
        NavigationStack {
            self.startCoordinator.contentView
        }
    }
    
    public func perform(action: Actions) async throws {
        switch action {
        case .refresh:
            print("REFRESH")
        }
    }
    
    public enum Actions {
        case refresh
    }
}
