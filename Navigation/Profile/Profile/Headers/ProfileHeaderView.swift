//import Foundation

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func openImagePickerController()
}

// MARK: - Properties

class ProfileHeaderView: UIView {

    private var statusText: String?    
    private var photoSource: [Photo] = PhotoSource.rundomPhotos(with: 20)
    private var itemSizeCollection = (UIScreen.main.bounds.width - 32)/4
    
    // MARK: - properties
    
    private var posts: [Post] = arrayPosts
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCellID")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCellID")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        return collectionView
    }()

    // Аватарка
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ava.jpeg")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Заголовок
    private lazy var titleLable: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Иван Солярка"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Ожидаем статус..."
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    // поля ввода для статуса
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set your status, bro..."
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textField.leftView =  UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        textField .leftViewMode = .always
        textField .translatesAutoresizingMaskIntoConstraints = false
        // add target
        textField .addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        return textField
    }()

    // Кнопка изменения статуса
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        // add target
        button.addTarget(self, action: #selector(self.showStatus), for: .touchUpInside)
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions

    private func addView() {
        addSubview(avatarImageView)
        addSubview(titleLable)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
        addSubview(collectionView)
    }

    func setup(with profile: Profile) {
        avatarImageView.image = profile.image ?? UIImage(systemName: "person.circle")
    }

    @objc private func showStatus() {
        let statusText = statusText ?? ""
        statusLabel.text = statusText.isEmpty ? "Ожидаем статус..." : statusText
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = self.statusTextField.text ?? ""
    }

    // MARK: - Constraints

    private func addConstraints() {

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor),
            
            titleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLable.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            
            statusLabel.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),

            statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            
            statusButton.topAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            //statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: statusButton.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: itemSizeCollection),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
}

extension ProfileHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCellID", for: indexPath) as? PhotoCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
            return cell
        }
        cell.imageView.image = UIImage(named: photoSource[indexPath.item].imageName)
        cell.layer.cornerRadius = 8
        cell.isUserInteractionEnabled = true
        
        return cell
    }    
}

extension ProfileHeaderView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemSizeCollection, height: itemSizeCollection)
    }
}
