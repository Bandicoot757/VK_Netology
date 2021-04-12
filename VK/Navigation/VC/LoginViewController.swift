//
//  LoginViewController.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 11.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    weak var coordinator: MainCoordinator?
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        self.delegate = Auth()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
           scrollView.contentInset.bottom = .zero
           scrollView.verticalScrollIndicatorInsets = .zero
       }
    
     private lazy var scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.toAutoLayout()
         scrollView.showsVerticalScrollIndicator = false
         scrollView.delegate = self
         return scrollView
     }()
    
     private let contentView: UIView = {
         let view = UIView()
         view.toAutoLayout()
         return view
     }()
        
    let logoImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "logo.png")
        imageView.image = image
        imageView.toAutoLayout()
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
//        textField.layer.cornerRadius = 10
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.tintColor = UIColor(named: "VKcolor")
        textField.roundCornersWithRadius(10, top: true, bottom: false, shadowEnabled: false)
        textField.toAutoLayout()
        return textField
        }()
    
    let passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.clipsToBounds = true
        textField.tintColor = UIColor(named: "VKcolor")
        textField.roundCornersWithRadius(10, top: false, bottom: true, shadowEnabled: false)
        textField.toAutoLayout()
        return textField
        }()
    
    lazy var loginButton: UIButton = {
        let button: UIButton = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        button.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        button.setTitle("Log In", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.toAutoLayout()
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func loginButtonTapped() {
        
        guard let login = loginTextField.text, !login.isEmpty else {
            
            let alert = UIAlertController(title: "Ошибка входа", message: "Введите логин", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty  else {
            
            let alert = UIAlertController(title: "Ошибка входа", message: "Введите пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        
            return
        }

        tabBarItem.isEnabled = false // Временное решение
        
        delegate?.сheckCredentials(login: login, password: password, vc: ProfileViewController())
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setSubviews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    func setSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImage)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)

    }
    
}
