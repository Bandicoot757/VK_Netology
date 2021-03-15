//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 18.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    weak var coordinator: PhotosCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self)
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()


        return collectionView
    }()
    
    private let navigationBar: UINavigationBar = {
        let navigationBar: UINavigationBar = UINavigationBar()
        navigationBar.backgroundColor = .white
        let navigationItem = UINavigationItem(title: "Photo Gallery")
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(cancelBarButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        navigationBar.setItems([navigationItem], animated: false)
        navigationBar.toAutoLayout()
        return navigationBar
    }()
    
    @objc func cancelBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        
        view.addSubview(navigationBar)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 44),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSource.photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        
        cell.photoGallery = DataSource.photoGallery[indexPath.item]
        
        return cell
    }
        
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    var offset: CGFloat {
        return 8
    }
    
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - offset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
}

