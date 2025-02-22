//
//  UserDetailViewController.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import UIKit

protocol UserDetailViewProtocol: AnyObject {
    func displayUser(_ user: User)
}

class UserDetailViewController: UIViewController, UserDetailViewProtocol {
    var presenter: UserDetailPresenterProtocol!

    // UI Elements
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(nameTextField)
        view.addSubview(saveButton)

        // Set up constraints
        NSLayoutConstraint.activate([
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20.0),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }

    func displayUser(_ user: User) {
        nameTextField.text = user.name
    }

    @objc private func saveButtonPressed() {
        guard let name = nameTextField.text, !name.isEmpty else {
            // Show an alert for empty name
            let alert = UIAlertController(title: "Error", message: "Name cannot be empty.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        presenter.saveButtonTapped(with: name)
    }
}
