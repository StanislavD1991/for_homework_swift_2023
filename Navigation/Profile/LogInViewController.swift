import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBrown
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBlue
        
        return contentView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        //stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .systemGray6
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy var inputBlockForLogin: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.font = UIFont.boldSystemFont(ofSize: 10)
        textField.placeholder = "Email of phone"
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var inputBlockForPassword: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.font = UIFont.boldSystemFont(ofSize: 10)
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var lineView: UIView = {
        let viewLine = UIView()
        viewLine.backgroundColor = .lightGray
        viewLine.translatesAutoresizingMaskIntoConstraints = false
        
        return viewLine
    }()
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.logoImageView)
        //self.view.addSubview(self.inputBlockForLogin)
        //self.view.addSubview(self.lineView)
        //self.view.addSubview(self.inputBlockForPassword)
        self.view.addSubview(self.stackView)
        self.view.addSubview(self.editButton)
        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.contentView)
        
        self.stackView.addArrangedSubview(self.inputBlockForLogin)
        self.stackView.addArrangedSubview(self.lineView)
        self.stackView.addArrangedSubview(self.inputBlockForPassword)
                
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 120),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            self.logoImageView.heightAnchor.constraint(equalTo: self.logoImageView.widthAnchor),
            self.logoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.stackView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            
            //self.inputBlockForLogin.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.inputBlockForLogin.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16),
            self.inputBlockForLogin.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16),
            self.inputBlockForLogin.heightAnchor.constraint(equalToConstant: 50),
            
            //self.lineView.topAnchor.constraint(equalTo: self.inputBlockForLogin.bottomAnchor, constant: 0),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
            //self.lineView.widthAnchor.constraint(equalToConstant: 0.5),
            
            //self.inputBlockForPassword.topAnchor.constraint(equalTo: self.inputBlockForLogin.bottomAnchor, constant: 0),
            self.inputBlockForPassword.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16),
            self.inputBlockForPassword.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16),
            self.inputBlockForPassword.heightAnchor.constraint(equalToConstant: 50),
            
            self.editButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            self.editButton.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16),
            self.editButton.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16),
            self.editButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @objc private func didTapButton(){
        let vc = ProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
}
