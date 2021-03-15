//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 26.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileVC = ProfileViewController()
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
    
    func openPhotos() {
        let child = PhotosCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
