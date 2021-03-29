//
//  TabBarController.swift
//  Life Cycle
//
//  Created by Stanislav Leontyev on 03.12.2020.
//

import UIKit

class TabBarController: UITabBarController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let mainCoordinator = MainCoordinator(navigationController: UINavigationController())
    let feedCoordinator = FeedCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appConfig = appDelegate.appConfiguration?.rawValue else {return}
        guard let url = URL(string: appConfig) else {return}

        NetworkManager.dataTask(url: url) { string in
            guard let data = string else {return}
                print(data)
        }
        
        mainCoordinator.start()
        feedCoordinator.start()
        
        viewControllers = [feedCoordinator.navigationController, mainCoordinator.navigationController]
    
    }
}
