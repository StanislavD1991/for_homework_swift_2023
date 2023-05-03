//import Foundation
import UIKit

protocol ProfileViewDelegate: AnyObject {
    func openImagePickerController()
}

class ProfileHeaderView: UIView{
    private var statusText: String?
    //Аватарка
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
    
    //Заголовок
    private lazy var titleLable: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Иван Солярка"
        label.font = UIFont(name: label.font.fontName, size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var statusLable: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Ожидаем статус..."
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
 
    private lazy var inputBlock: UITextField = {
        let input = UITextField(frame: .zero)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        input.backgroundColor = .white
        input.layer.cornerRadius = 12
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.black.cgColor
        input.textColor = .black
        input.font = UIFont.systemFont(ofSize: 15.0)
        input.font = UIFont.boldSystemFont(ofSize: 10)
        input.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        input.translatesAutoresizingMaskIntoConstraints = false
        
        return input
    }()
 
    //рисуем кнопку
    private lazy var editButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.showStatus), for: .touchUpInside)
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var newButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemGreen
        button.setTitle("кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
        self.addSubview(self.avatarImageView)
        self.addSubview(self.titleLable)
        self.addSubview(self.statusLable)
        self.addSubview(self.editButton)
        self.addSubview(self.inputBlock)
        self.addSubview(self.newButton)
                
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor),
            
            self.titleLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.titleLable.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            
            self.statusLable.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 25),
            self.statusLable.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),

            self.editButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.editButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            self.editButton.heightAnchor.constraint(equalToConstant: 50),

            self.inputBlock.topAnchor.constraint(equalTo: self.statusLable.bottomAnchor, constant: 16),
            self.inputBlock.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            self.inputBlock.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.inputBlock.heightAnchor.constraint(equalToConstant: 50),

            self.newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 150),
            self.newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setup(with profile: Profile){
        self.avatarImageView.image = profile.image ?? UIImage(systemName: "person.circle")
    }
    
    @objc private func showStatus() {
        self.statusLable.text = self.statusText
    }
    
    @objc private func statusTextChanged(_ textField: UITextField){
        self.statusText = self.inputBlock.text ?? ""
    }
}
 
