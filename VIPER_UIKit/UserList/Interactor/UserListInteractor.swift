//
//  UserListInteractor.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

protocol UserListInteractorInputProtocol: AnyObject {
    var presenter: UserListInteractorOutputProtocol? { get set }
    var users: [User] { get set }
    func fetchUsers()
    func updateUser(_ user: User)
}

protocol UserListInteractorOutputProtocol: AnyObject {
    func didFetchUsers(_ users: [User])
    func didFailToFetchUsers(with error: Error)
}

class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
    var users: [User] = []

    func fetchUsers() {
        // Simulate network call
        DispatchQueue.global().async {
            self.users = [User(id: 1, name: "Alice"), User(id: 2, name: "Bob")]
            DispatchQueue.main.async {
                self.presenter?.didFetchUsers(self.users)
            }
        }
    }

    func updateUser(_ user: User) {
        if let index = users.firstIndex(of: user) {
            users[index] = user
            presenter?.didFetchUsers(users)
        }
    }
}
