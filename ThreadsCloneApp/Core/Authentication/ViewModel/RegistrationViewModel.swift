//
//  RegistrationViewModel.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func creatUser() async throws {
        try await AuthService.shared.creatUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
