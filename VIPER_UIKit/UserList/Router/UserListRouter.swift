//
//  UserListRouter.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import UIKit

protocol UserListRouterProtocol: AnyObject {
    static func assembleModule() -> UIViewController
    func navigateToUserDetail(with user: User)
}

class UserListRouter: UserListRouterProtocol {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = UserListViewController()
        let interactor = UserListInteractor()
        let router = UserListRouter()
        let presenter = UserListPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToUserDetail(with user: User) {
        let detailViewController = UserDetailViewController(user: user)
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
