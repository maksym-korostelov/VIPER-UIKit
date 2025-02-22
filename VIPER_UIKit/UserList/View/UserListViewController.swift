//
//  UserListViewController.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import UIKit

protocol UserListViewProtocol: AnyObject {
    func showUsers(_ users: [User])
    func showError(_ error: String)
}

class UserListViewController: UIViewController {
    var presenter: UserListPresenterProtocol!

    private var users: [User] = []
    private let tableView = UITableView()
    
    private let cellIdentifier = "UserCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView() // Hide empty rows
        
        // Add tableView to the view and set constraints
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension UserListViewController: UserListViewProtocol {
    func showUsers(_ users: [User]) {
        self.users = users
        tableView.reloadData()
    }

    func showError(_ error: String) {
        // Present an alert with the error message
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    // Number of rows in the section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    // Cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    // Handling row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        presenter.didSelectUser(user)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
