//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 26.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let feedVC = FeedViewController()
        feedVC.coordinator = self
        feedVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Home"), tag: 0)
        navigationController.pushViewController(feedVC, animated: true)
    }
    
}
