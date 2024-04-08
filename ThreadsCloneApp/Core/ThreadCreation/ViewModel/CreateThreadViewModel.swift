//
//  CreateThreadViewModel.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //let thread = Thread(ownerUid: NSUUID().uuidString, caption: caption, timestamp: Timestamp(), likes: 0)
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
