//
//  ProfilePostCell.swift
//  Navigation
//
//  Created by Stanislav on 08.06.2023.
//

import UIKit

final class ProfilePostCell: UITableViewCell {
    
    // TODO: - структурировать аналогично с ProfileViewController или с ProfileHeaderView
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var postLabelAuthor: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postLabelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postLabelLikes: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postLabelViews: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: -  по аналогии
    
    func setup(post: Post) {
        self.postImageView.image = UIImage(named: post.image)
        self.postLabelAuthor.text = "\(post.author)\n"
        self.postLabelDescription.text = "\(post.description)\n"
        self.postLabelLikes.text = "Likes: \(post.likes)"
        self.postLabelViews.text = "View: \(post.views)"
    }
    
    // MARK: - по аналогии
    
    private func setupView() {
        self.backgroundColor = .black
        contentView.addSubview(self.postImageView)
        contentView.addSubview(self.postLabelAuthor)
        contentView.addSubview(self.postLabelDescription)
        contentView.addSubview(self.postLabelLikes)
        contentView.addSubview(self.postLabelViews)
    }

    // MARK: - по аналогии

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30),
            postImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 35),
            postImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -35),
            postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            postLabelAuthor.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 10),
            postLabelAuthor.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            postLabelAuthor.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),

            postLabelDescription.topAnchor.constraint(equalTo: self.postLabelAuthor.bottomAnchor),
            postLabelDescription.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            postLabelDescription.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),

            postLabelLikes.topAnchor.constraint(equalTo: self.postLabelDescription.bottomAnchor, constant: 10),
            postLabelLikes.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            postLabelLikes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            postLabelViews.topAnchor.constraint(equalTo: self.postLabelDescription.bottomAnchor, constant: 10),
            postLabelViews.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            postLabelViews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
}

