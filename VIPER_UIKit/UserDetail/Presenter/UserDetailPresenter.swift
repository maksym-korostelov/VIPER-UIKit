//
//  UserDetailPresenter.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import Foundation

protocol UserDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func saveButtonTapped(with name: String)
}

class UserDetailPresenter: UserDetailPresenterProtocol {
    weak var view: UserDetailViewProtocol?
    var interactor: UserDetailInteractorInputProtocol
    var router: UserDetailRouterProtocol
    weak var delegate: UserDetailDelegate?

    init(view: UserDetailViewProtocol, interactor: UserDetailInteractorInputProtocol, router: UserDetailRouterProtocol, delegate: UserDetailDelegate?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }

    func viewDidLoad() {
        if let interactor = interactor as? UserDetailInteractor {
            view?.displayUser(interactor.user)
        }
    }

    func saveButtonTapped(with name: String) {
        guard var user = (interactor as? UserDetailInteractor)?.user else { return }
        user.name = name
        interactor.updateUser(user)
    }
}

extension UserDetailPresenter: UserDetailInteractorOutputProtocol {
    func didUpdateUser(_ user: User) {
        delegate?.didUpdateUser(user)
        router.navigateBack()
    }
}
