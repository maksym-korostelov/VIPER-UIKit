//
//  UserDetailInteractor.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

protocol UserDetailInteractorInputProtocol: AnyObject {
    func updateUser(_ user: User)
}

protocol UserDetailInteractorOutputProtocol: AnyObject {
    func didUpdateUser(_ user: User)
}

class UserDetailInteractor: UserDetailInteractorInputProtocol {
    weak var presenter: UserDetailInteractorOutputProtocol?
    var user: User

    init(user: User) {
        self.user = user
    }

    func updateUser(_ user: User) {
        // Update the user data (e.g., save to a database or API)
        // For this example, we'll simply pass the user back
        self.user = user
        presenter?.didUpdateUser(user)
    }
}
