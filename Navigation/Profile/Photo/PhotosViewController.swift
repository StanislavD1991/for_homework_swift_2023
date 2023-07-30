//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Stanislav on 15.07.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    // MARK: - Properties

    // TODO: - посмотреть, что это и за что отвечает
    var photoSource: [Photo] = PhotoSource.rundomPhotos(with: 20)


    var itemSizeCollection = (UIScreen.main.bounds.width - 32)/3

    // layout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 15, left: 8, bottom: 15, right: 8)
        return layout
    }()

    // коллекция
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCellID")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCellID")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black 
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //заголовок
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Фотографии"
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    //Кнопка
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("👈 Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigionBar()
        addView()
        addConstraints()
    }

    // MARK: - Functions

    private func addView() {
        view.addSubview(buttonBack)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
    }

    @objc private func didTapButton(){
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setupNavigionBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Галерея"
    }
    

    // MARK: - Constraints

    private func addConstraints() {

        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonBack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            //buttonBack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonBack.widthAnchor.constraint(equalToConstant: 100),
            buttonBack.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -150),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCellID", for: indexPath) as? PhotoCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
            return cell
        }
        cell.imageView.image = UIImage(named: photoSource[indexPath.item].imageName)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemSizeCollection, height: itemSizeCollection)
    }
}
