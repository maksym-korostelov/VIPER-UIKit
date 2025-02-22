//
//  UserTableViewCell.swift
//  VIPER_UIKit
//
//  Created by Maksym Korostelov on 22/02/2025.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    // MARK: - UI Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add nameLabel to the contentView
        contentView.addSubview(nameLabel)
        
        // Set up constraints for nameLabel
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configuration
    func configure(with user: User) {
        nameLabel.text = user.name
    }
}
