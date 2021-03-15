//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 26.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContent()
    }
    
    private var statusText: String = ""
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Удав задумчивый"
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "udav.jpg")
        imageView.image = image
        imageView.sizeToFit()
        imageView.layer.cornerRadius = imageView.bounds.width/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Waiting for something..."
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        textField.isEnabled = false
        textField.toAutoLayout()
        return textField
    }()
    
    lazy var statusInputTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Set your status..."
        textField.addTarget(self, action: #selector(statusChanged), for: .editingChanged)
        textField.toAutoLayout()
        return textField
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Set status", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.toAutoLayout()
        button.addTarget(self, action: #selector(statusButtonTapped), for: .touchUpInside)
        return button
    }()

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    func configureContent() {
   
        contentView.addSubview(nameLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(statusButton)
        contentView.addSubview(statusTextField)
        contentView.addSubview(statusInputTextField)
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),

            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.heightAnchor.constraint(equalToConstant: 122),
            profileImageView.widthAnchor.constraint(equalToConstant: 122),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -67),
            statusTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            
            statusInputTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            statusInputTextField.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            statusInputTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            statusInputTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            
        ])
    }
    
    @objc func statusChanged() {
        statusText = statusInputTextField.text!
    }
    
    @objc func statusButtonTapped() {
        statusTextField.text = statusText
        print(statusTextField.text!)
    }

}
