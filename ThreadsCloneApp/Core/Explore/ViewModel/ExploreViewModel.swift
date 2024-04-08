//
//  ExploreViewModel.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
