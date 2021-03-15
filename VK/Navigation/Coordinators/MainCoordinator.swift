//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 08.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        loginVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Person"), tag: 1)
        navigationController.pushViewController(loginVC, animated: false)
    }
    
    func openProfile() {
        let child = ProfileCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
