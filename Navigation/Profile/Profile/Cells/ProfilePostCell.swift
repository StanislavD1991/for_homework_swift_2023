//
//  ProfilePostCell.swift
//  Navigation
//
//  Created by Stanislav on 08.06.2023.
//

import UIKit

final class ProfilePostCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
    
    // MARK: - Lifecycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func setup(post: Post) {
        self.postImageView.image = UIImage(named: post.image)
        self.postLabelAuthor.text = "\(post.author)\n"
        self.postLabelDescription.text = "\(post.description)\n"
        self.postLabelLikes.text = "Likes: \(post.likes)"
        self.postLabelViews.text = "View: \(post.views)"
    }    
    
    // MARK: - Private methods
    
    private func setupView() {
        self.backgroundColor = .black
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.postLabelAuthor)
        self.contentView.addSubview(self.postLabelDescription)
        self.contentView.addSubview(self.postLabelLikes)
        self.contentView.addSubview(self.postLabelViews)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.postImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.postImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.postImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

            self.postLabelAuthor.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor),
            self.postLabelAuthor.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.postLabelAuthor.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

            self.postLabelDescription.topAnchor.constraint(equalTo: self.postLabelAuthor.bottomAnchor),
            self.postLabelDescription.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.postLabelDescription.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),

            self.postLabelLikes.topAnchor.constraint(equalTo: self.postLabelDescription.bottomAnchor),
            self.postLabelLikes.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.postLabelLikes.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            self.postLabelViews.topAnchor.constraint(equalTo: self.postLabelDescription.bottomAnchor),
            self.postLabelViews.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.postLabelViews.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
}

