//
//  Timestamp.swift
//  ThreadsCloneApp
//
//  Created by Alican TARIM on 8.04.2024.
//

import Foundation
import Firebase

extension Timestamp {
    func timestammpString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
