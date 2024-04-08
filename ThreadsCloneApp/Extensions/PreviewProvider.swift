//
//  PreviewProvider.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 6.04.2024.
//

import Foundation
import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1", profileImageUrl: nil, bio: nil)
    
    let thread = Thread(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
