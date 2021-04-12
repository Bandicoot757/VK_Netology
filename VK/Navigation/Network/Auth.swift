//
//  Auth.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 10.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import FirebaseAuth

class Auth: LoginViewControllerDelegate {
    
    func сheckCredentials(login: String, password: String, vc: UIViewController) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: login, password: password) { [weak self] result, error in
            
            guard let strongSelf = self else {return}
            
            if let error = error as NSError? {
                
                switch AuthErrorCode(rawValue: error.code) {
                
                case .emailAlreadyInUse:
                    print ("account already in use")
                
                case .userNotFound:
                    strongSelf.showSignUpAlert(login: login, password: password, vc: vc)
                
                case .wrongPassword:
                    strongSelf.showWrongPasswordAlert()
                    
                case .networkError:
                    strongSelf.showNetworkErrorAlert()
                    
                default:
                    print(error.localizedDescription)
                }
            } else {

                UIApplication.topViewController()?.show(vc, sender: nil)
            }
            
        }
        
    }
    
    func showSignUpAlert(login: String, password: String, vc: UIViewController) {
        
        let alert = UIAlertController(title: "Аккаунт с указанными данными не найден", message: "Вы хотите создать новый аккаунт?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Создать аккаунт и войти", style: .default, handler: { _ in
            FirebaseAuth.Auth.auth().createUser(withEmail: login, password: password) { error, result in
                guard error == nil else {
                    print("Sign up error")
                    return
                }
            }
            UIApplication.topViewController()?.show(vc, sender: nil)
        }))
        alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: nil))

        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        
    }
    
    func showWrongPasswordAlert() {
        
        let alert = UIAlertController(title: "Ошибка входа", message: "Введен неверный пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: nil))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    func showNetworkErrorAlert() {
        let alert = UIAlertController(title: "Ошибка входа", message: "Отсутствует подключение к интернету", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: nil))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }

}
