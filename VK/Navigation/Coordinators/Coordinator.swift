//
//  Coordinator.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 08.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}

    func start()
}

