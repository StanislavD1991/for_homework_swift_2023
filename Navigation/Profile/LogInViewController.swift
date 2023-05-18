import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemYellow
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
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

        self.stackView.addArrangedSubview(self.inputBlockForLogin)
        self.stackView.addArrangedSubview(self.lineView)
        self.stackView.addArrangedSubview(self.inputBlockForPassword)
        
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.stackView)
        self.contentView.addSubview(self.editButton)
        
        self.scrollView.addSubview(self.contentView)

        self.view.addSubview(self.scrollView)
    
        let safeAreaGuide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            self.logoImageView.heightAnchor.constraint(equalTo: self.logoImageView.widthAnchor),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.stackView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            
            self.inputBlockForLogin.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.inputBlockForLogin.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.inputBlockForLogin.heightAnchor.constraint(equalToConstant: 50),
            
            self.lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            self.inputBlockForPassword.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.inputBlockForPassword.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.inputBlockForPassword.heightAnchor.constraint(equalToConstant: 50),
            
            self.editButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            self.editButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.editButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.editButton.heightAnchor.constraint(equalToConstant: 50),
          
            self.scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: safeAreaGuide.widthAnchor),
            
            self.contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalToConstant: 700),
        ])
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
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
