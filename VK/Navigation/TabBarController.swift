//
//  TabBarController.swift
//  Life Cycle
//
//  Created by Stanislav Leontyev on 03.12.2020.
//

import UIKit

class TabBarController: UITabBarController {
    
    let mainCoordinator = MainCoordinator(navigationController: UINavigationController())
    let feedCoordinator = FeedCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCoordinator.start()
        feedCoordinator.start()
        
        viewControllers = [feedCoordinator.navigationController, mainCoordinator.navigationController]
    
    }
}
