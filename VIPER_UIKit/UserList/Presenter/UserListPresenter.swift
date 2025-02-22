//
//  UserListPresenter.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

protocol UserListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectUser(_ user: User)
}

class UserListPresenter: UserListPresenterProtocol {
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol
    var router: UserListRouterProtocol

    init(view: UserListViewProtocol, interactor: UserListInteractorInputProtocol, router: UserListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.fetchUsers()
    }

    func didSelectUser(_ user: User) {
        router.navigateToUserDetail(with: user)
    }
}

extension UserListPresenter: UserListInteractorOutputProtocol {
    func didFetchUsers(_ users: [User]) {
        view?.showUsers(users)
    }

    func didFailToFetchUsers(with error: Error) {
        view?.showError(error.localizedDescription)
    }
}
