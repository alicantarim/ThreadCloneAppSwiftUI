//
//  AuthService.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    //MARK: - Login User
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            //print("DEBUG: Login user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Create User
    @MainActor
    func creatUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            //print("DEBUG: Created user \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    //MARK: - Signout User
    func signOut() {
        try? Auth.auth().signOut() // signs out on backend
        self.userSession = nil // this removes session locally and updates routing
        UserService.shared.reset()  // sets current user object to nil
    }
    
    //MARK: - Upload User Data
    @MainActor
    private func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username, profileImageUrl: nil, bio: nil)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
