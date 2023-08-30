//
//  ProfileHeaderView.swift
//  Navigator
//
//  Created by Stanislav on 18.08.2023.
//

import UIKit
import SnapKit

final class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // MARK: Visual objects
    
    lazy var fullNameLabel = UILabel()
    var avatarImageView = UIImageView()
    var statusLabel = UILabel()
    var statusTextField = UITextField()
    var setStatusButton = UIButton()
    var returnAvatarButton = UIButton()
    var avatarBackground = UIView()
    
    private var statusText = "Ожидание статуса"
    private var avatarOriginPoint = CGPoint()
    
    // MARK: - Setup section
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupNameLabel()
        setupStatusLabel()
        setupStatusTextField()
        setupStatusButton()
        setupAvatarImage()
        
        statusTextField.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    private func setupNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Иван Солярка"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        addSubview(fullNameLabel)
//        NSLayoutConstraint.activate([
//            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            fullNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 156),
//            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            fullNameLabel.heightAnchor.constraint(equalToConstant: 28),
//        ])
        fullNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(156)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.height.equalTo(28)
        }
    }
    
    private func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = statusText
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.textColor = .black
        addSubview(statusLabel)
//        NSLayoutConstraint.activate([
//            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
//            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
//            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
//            statusLabel.heightAnchor.constraint(equalTo: fullNameLabel.heightAnchor),
//        ])
        statusLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(16)
            make.leading.equalTo(fullNameLabel.snp.leading)
            make.trailing.equalTo(fullNameLabel.snp.trailing)
            make.height.equalTo(fullNameLabel.snp.height)
        }
    }
    
    private func setupStatusTextField() {
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.textColor = .darkGray
        statusTextField.backgroundColor = .white
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        statusTextField.leftView = paddingView
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 8
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.gray.cgColor
        statusTextField.attributedPlaceholder = NSAttributedString.init(string: "Укажите статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
//        NSLayoutConstraint.activate([
//            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
//            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
//            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
//            statusTextField.heightAnchor.constraint(equalToConstant: 32),
//        ])
        statusTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
            make.leading.equalTo(statusLabel.snp.leading)
            make.trailing.equalTo(statusLabel.snp.trailing)
            make.height.equalTo(32)
        }
    }
    
    private func setupStatusButton() {
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = LayoutConstants.cornerRadius
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setStatusButton.setTitle("Обновить статус", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        addSubview(setStatusButton)
//        NSLayoutConstraint.activate([
//            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
//            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            setStatusButton.heightAnchor.constraint(equalToConstant: 48),
//        ])
        setStatusButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(statusTextField.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.height.equalTo(48)
        }
    }
    
    private func setupAvatarImage() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "ava")
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        
        // add a tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnAvatar))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
        
        // cancel an animation mode
        returnAvatarButton.translatesAutoresizingMaskIntoConstraints = false
        returnAvatarButton.alpha = 0
        returnAvatarButton.backgroundColor = .clear
        returnAvatarButton.contentMode = .scaleToFill
        returnAvatarButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))?.withTintColor(.black, renderingMode: .automatic), for: .normal)
        returnAvatarButton.tintColor = .black
        returnAvatarButton.addTarget(self, action: #selector(returnAvatarToOrigin), for: .touchUpInside)
        
        // translucent background for the modal animation mode
        avatarBackground = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        avatarBackground.backgroundColor = .darkGray
        avatarBackground.isHidden = true
        avatarBackground.alpha = 0
        
        //addSubviews(avatarBackground, avatarImageView, returnAvatarButton)        
        addSubview(avatarBackground)
        addSubview(avatarImageView)
        addSubview(returnAvatarButton)
//        NSLayoutConstraint.activate([
//            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
//            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
//
//            returnAvatarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            returnAvatarButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//        ])
        avatarImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.width.equalTo(128)
            make.height.equalTo(avatarImageView.snp.width)
        }        
        returnAvatarButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    // MARK: - Event handlers
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc private func statusButtonPressed() {
        statusLabel.text = statusText
    }
    
    @objc private func didTapOnAvatar() {
        // create an animation
        avatarImageView.isUserInteractionEnabled = false
        
        ProfileViewController.postTableView.isScrollEnabled = false
        ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
        
        avatarOriginPoint = avatarImageView.center
        let scale = UIScreen.main.bounds.width / avatarImageView.bounds.width
        
        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.center = CGPoint(x: UIScreen.main.bounds.midX,
                                                  y: UIScreen.main.bounds.midY - self.avatarOriginPoint.y)
            self.avatarImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarBackground.isHidden = false
            self.avatarBackground.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.returnAvatarButton.alpha = 1
            }
        }
    }
    
    @objc private func returnAvatarToOrigin() {
        UIImageView.animate(withDuration: 0.5) {
            UIImageView.animate(withDuration: 0.5) {
                self.returnAvatarButton.alpha = 0
                self.avatarImageView.center = self.avatarOriginPoint
                self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
                self.avatarBackground.alpha = 0
            }
        } completion: { _ in
            ProfileViewController.postTableView.isScrollEnabled = true
            ProfileViewController.postTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
            self.avatarImageView.isUserInteractionEnabled = true
        }
    }
}

// MARK: - Extension

extension ProfileHeaderView: UITextFieldDelegate {
    
    // tap 'done' on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
