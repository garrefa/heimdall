import SwiftUI
import Combine

enum LoginScene {
    enum Actions {
        case auth(user: String, pass: String)
    }
}

extension LoginScene {
    struct CredentialsValidator {
        let minUsernameLength: Int
        let minPasswordLength: Int
        
        init(
            minUsernameLength: Int = 5,
            minPasswordLength: Int = 5
        ) {
            self.minUsernameLength = minUsernameLength
            self.minPasswordLength = minPasswordLength
        }
        
        func validate(user: String) -> Bool {
            user.count >= minUsernameLength
        }
        
        func validate(pass: String) -> Bool {
            pass.count >= minPasswordLength
        }
    }
}

extension LoginScene {
    final class DataModel: ObservableObject {
        @Published var username: String {
            didSet {
                usernameIsValid = validator.validate(user: username)
            }
        }
        
        @Published var usernameIsValid: Bool = false
        
        @Published var password: String {
            didSet {
                passwordIsValid = validator.validate(pass: password)
            }
        }
        
        @Published var passwordIsValid: Bool = false
        
        private let validator: CredentialsValidator
        
        init(
            username: String = "",
            password: String = "",
            validator: CredentialsValidator = CredentialsValidator()
        ) {
            self.username = username
            self.password = password
            self.validator = validator
        }
    }
}

extension LoginScene {
    final class Coordinator: ObservableObject, ViewCoordinator {
        private var dataModel: DataModel
        
        init(dataModel: DataModel = DataModel()) {
            self.dataModel = dataModel
        }
        
        @ViewBuilder
        public var contentView: some View {
            ContentView(
                dataModel: self.dataModel,
                actionHandler: self.perform(action:)
            )
            .navigationTitle("LoginScene")
        }
        
        @MainActor
        public func perform(action: Actions) async throws {
            switch action {
            case .auth(let user, let pass):
                if (user == "12345" && pass == "12345") {
                    print("Authenticated")
                } else {
                    print("Wrong credentials")
                }
            }
        }
    }
}

extension LoginScene {
    private struct ContentView: View {
        typealias ActionHandler = (Actions) async throws -> Void
        
        @ObservedObject var dataModel: DataModel
        @State var isUsernameValid: Bool? = nil
        
        private let actionHandler: ActionHandler
        
        init(
            dataModel: DataModel,
            actionHandler: @escaping ActionHandler
        ) {
            self.dataModel = dataModel
            self.actionHandler = actionHandler
        }
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Username")
                    TextField(
                        "Username",
                        text: $dataModel.username,
                        onEditingChanged: { finished in
                            print("validate: \(finished ? "true" : "false")")
                        })
                        .autocorrectionDisabled()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .border(
//                            (dataModel.usernameIsValid && !dataModel.username.isEmpty) ? Color.clear : Color.pink,
//                            width: 2
//                        )
                        .padding(.bottom)
                    
                    Text("Password")
                    TextField("Password", text: $dataModel.password)
                        .autocorrectionDisabled()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    Button(
                        action: {
                            userDidPressLogin()
                        },
                        label: {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                        }
                    )
                    .disabled(!dataModel.usernameIsValid || !dataModel.passwordIsValid)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color.blue.opacity(0.05))
        }
        
        private func userDidPressLogin() {
            print(#function)
            Task {
                let user = dataModel.username
                let pass = dataModel.password
                try? await actionHandler(.auth(user: user, pass: pass))
            }
        }
    }
}

struct LoginScene_Previews: PreviewProvider {
    static var previews: some View {
        LoginScene
            .Coordinator()
            .contentView
    }
}
