//
//  UserDetailRouter.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import UIKit

protocol UserDetailRouterProtocol: AnyObject {
    static func assembleModule(with user: User, delegate: UserDetailDelegate?) -> UIViewController
    func navigateBack()
}

/// Based on VIPER, the UserDetailDelegate should be placed in the Router layer of the UserDetail module,
/// OR
/// Defined in a shared protocol file `accessible to both modules`.
/// It facilitates communication between the UserDetail module and the UserList module without breaking the separation of concerns.
protocol UserDetailDelegate: AnyObject {
    func didUpdateUser(_ user: User)
}


class UserDetailRouter: UserDetailRouterProtocol {
    weak var viewController: UIViewController?

    static func assembleModule(with user: User, delegate: UserDetailDelegate?) -> UIViewController {
        let view = UserDetailViewController()
        let interactor = UserDetailInteractor(user: user)
        let router = UserDetailRouter()
        let presenter = UserDetailPresenter(view: view, interactor: interactor, router: router, delegate: delegate)

        view.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
