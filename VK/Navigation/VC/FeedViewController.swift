//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    weak var coordinator: FeedCoordinator?
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
    let planetUrl = URL(string: "https://swapi.dev/api/planets/1/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        guard let url = url else {return}
        guard let planetUrl = planetUrl else {return}
        
        DataLoader.loadDataWithSerialization(url: url) { user in
            DispatchQueue.main.async {
                self.titleLabel.text = user.title
            }
        }
        
        DataLoader.loadDataWithDecode(url: planetUrl) { planet in
            DispatchQueue.main.async {
                self.planetOrbitalPeriodLabel.text = planet.orbitalPeriod
            }
        }
    }
    
   private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .white
        return label
    }()
    
    private lazy var planetOrbitalPeriodLabel: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .white
         return label
     }()
    
    override func viewWillLayoutSubviews() {
        view.addSubviews(titleLabel)
        view.addSubviews(planetOrbitalPeriodLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),
            
            planetOrbitalPeriodLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            planetOrbitalPeriodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            planetOrbitalPeriodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            planetOrbitalPeriodLabel.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
    // Open post is not implemented now

}
