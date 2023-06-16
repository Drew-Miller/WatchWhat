//
//  AuthenticationViewModel.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/19/23.
//

import Combine
import Foundation
import FirebaseAuth

enum AuthenticationState {
    case unauthenticated
    case authenticating
    case authenticated
}

enum AuthenticationFlow {
    case login
    case signUp
}

@MainActor
class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var flow: AuthenticationFlow = .login
    
    @Published var isValid  = false
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var errorMessage = ""
    @Published var user: User?
    @Published var displayName = ""
    
    let defaults = UserDefaults.standard
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        registerAuthStateHandler()
        
        $errorMessage
            .sink { message in print(message) }
            .store(in: &cancellables)
        
        $user
            .filter { $0 != nil }
            .sink { user in self.getAuthToken(user: user) }
            .store(in: &cancellables)
        
        $flow
            .combineLatest($email, $password, $confirmPassword)
            .map { flow, email, password, confirmPassword in
                flow == .login
                ? !(email.isEmpty || password.isEmpty)
                : !(email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
            }
            .assign(to: &$isValid)
    }
    
    private static var authStateHandler: AuthStateDidChangeListenerHandle?
    
    func registerAuthStateHandler() {
        if AuthenticationViewModel.authStateHandler == nil {
            AuthenticationViewModel.authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.user = user
                self.authenticationState = user == nil ? .unauthenticated : .authenticated
                self.displayName = user?.email ?? ""
            }
        }
    }
    
    func getAuthToken(user: User?) {
        guard let user = user else {
            return
        }
        
        user.getIDTokenForcingRefresh(true) { token, error in
            if let error = error {
                // Handle error
                self.errorMessage = "Error getting token: \(error.localizedDescription)"
                self.defaults.set("", forKey: .defaultKeys.token)
                return;
            }
            
            self.defaults.set(token, forKey: .defaultKeys.token)
        }
    }
    
    func switchFlow() {
        flow = flow == .login ? .signUp : .login
        errorMessage = ""
    }
    
    private func wait() async {
        do {
            print("Wait")
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("Done")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func reset() {
        flow = .login
        email = ""
        password = ""
        confirmPassword = ""
    }
}

// MARK: - Email and Password Authentication
extension AuthenticationViewModel {
    func signInWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do {
            try await Auth.auth().signIn(withEmail: self.email, password: self.password)
            return true
        }
        catch  {
            print(error)
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signUpWithEmailPassword() async -> Bool {
        authenticationState = .authenticating
        do  {
            try await Auth.auth().createUser(withEmail: email, password: password)
            return true
        }
        catch {
            errorMessage = error.localizedDescription
            authenticationState = .unauthenticated
            return false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
            return true
        }
        catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
