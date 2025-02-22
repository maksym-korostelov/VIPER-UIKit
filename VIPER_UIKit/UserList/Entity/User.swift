//
//  User.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

struct User: Equatable {
    let id: Int
    var name: String

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
