//
//  UserListInteractor.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

protocol UserListInteractorInputProtocol: AnyObject {
    var presenter: UserListInteractorOutputProtocol? { get set }
    func fetchUsers()
}

protocol UserListInteractorOutputProtocol: AnyObject {
    func didFetchUsers(_ users: [User])
    func didFailToFetchUsers(with error: Error)
}

class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?

    func fetchUsers() {
        // Simulate network call
        DispatchQueue.global().async {
            let users = [User(id: 1, name: "Alice"), User(id: 2, name: "Bob")]
            DispatchQueue.main.async {
                self.presenter?.didFetchUsers(users)
            }
        }
    }
}
