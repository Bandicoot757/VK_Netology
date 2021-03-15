//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Stanislav Leontyev on 12.10.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let authorLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    let postImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        let image = UIImage()
        imageView.image = image
        imageView.toAutoLayout()
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.toAutoLayout()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    var likesLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Likes:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    var likesCounterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    var viewsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Views:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    let viewsCounterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    private func setContent() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(likesCounterLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(viewsCounterLabel)
        
        NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: likesCounterLabel.topAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: likesCounterLabel.leadingAnchor, constant: -8),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            likesCounterLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesCounterLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 8),
            likesCounterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewsLabel.trailingAnchor.constraint(equalTo: viewsCounterLabel.leadingAnchor, constant: -16),
         
            viewsCounterLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsCounterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsCounterLabel.leadingAnchor.constraint(equalTo: viewsLabel.trailingAnchor, constant: 16),
            viewsCounterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ])
    }
    
     func configure(post: Post) {
        authorLabel.text = post.author
        postImageView.image = post.image
        descriptionLabel.text = post.description
        likesCounterLabel.text = String(post.likes)
        viewsCounterLabel.text = String(post.views)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setContent()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setContent()
    }

}
