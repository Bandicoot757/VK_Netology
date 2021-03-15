//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 18.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photoGallery: Photo? {
        
        didSet {
            guard let photoGallery = photoGallery else { return }
            imageView.image = photoGallery.image

        }
    }
    
     let imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.sizeToFit()
        imageView.layer.masksToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    func setupLayout() {
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
