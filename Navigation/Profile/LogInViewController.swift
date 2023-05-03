import UIKit

class LogInViewController: UIViewController {
  
    private lazy var LogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var MyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.backgroundColor = .systemBlue
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var inputBlockForLogin: UITextField = {
        let input = UITextField()
        input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: input.frame.height))
        input.leftViewMode = .always
        input.textColor = .black
        input.font = UIFont.systemFont(ofSize: 16.0)
        input.font = UIFont.boldSystemFont(ofSize: 10)
        input.placeholder = "Email of phone"
        input.autocapitalizationType = .none
        input.translatesAutoresizingMaskIntoConstraints = false
        
        return input
    }()
    
    private lazy var inputBlockForPassword: UITextField = {
        let input = UITextField()
        input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: input.frame.height))
        input.leftViewMode = .always
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.borderWidth = 0.5
        input.textColor = .black
        input.placeholder = "Password"
        input.isSecureTextEntry = true
        input.translatesAutoresizingMaskIntoConstraints = false
        
        return input
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.LogoImageView)
        self.view.addSubview(self.inputBlockForLogin)
        self.view.addSubview(self.inputBlockForPassword)
        self.view.addSubview(self.editButton)
        self.view.addSubview(self.MyStackView)
        
        let logoImageHeaderView = LogoImageHeaderView()
        let inputBlockForLoginHeaderView = InputBlockForLoginHeaderView()
        let inputBlockForPasswordHeaderView = InputBlockForPasswordHeaderView()
        let editButtonView = editButtonView()
        let myStackView = myStackView()
        
        self.MyStackView.center = self.view.center
        self.MyStackView.addArrangedSubview(self.inputBlockForLogin)
        self.MyStackView.addArrangedSubview(self.inputBlockForPassword)
        
        //активация констрейна
        NSLayoutConstraint.activate(logoImageHeaderView)
        NSLayoutConstraint.activate(myStackView)
        NSLayoutConstraint.activate(inputBlockForLoginHeaderView)
        NSLayoutConstraint.activate(inputBlockForPasswordHeaderView)
        NSLayoutConstraint.activate(editButtonView)
    }
    
    private func LogoImageHeaderView() -> [NSLayoutConstraint]{
        let topContraint = self.LogoImageView.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 120)
        let widthAnchor = self.LogoImageView.widthAnchor.constraint(equalToConstant: 100)
        let heightAnchor = self.LogoImageView.heightAnchor.constraint(equalTo: self.LogoImageView.widthAnchor)
        let centerXAnchor = self.LogoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor)
        
        return [
            topContraint, heightAnchor, widthAnchor, centerXAnchor
        ]
    }
   
    private func myStackView() -> [NSLayoutConstraint]{
        let topContraint = self.LogoImageView.topAnchor.constraint(equalTo: self.LogoImageView.bottomAnchor, constant: 20)
        let heightAnchor = self.LogoImageView.heightAnchor.constraint(equalToConstant: 100)
        let centerXAnchor = self.LogoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor)
        
        return [
            topContraint, heightAnchor, centerXAnchor
        ]
    }
    
    private func InputBlockForLoginHeaderView() -> [NSLayoutConstraint]{
        let topContraint = self.inputBlockForLogin.topAnchor.constraint(equalTo: self.LogoImageView.bottomAnchor, constant: 120)
        let leadingAnchor = self.inputBlockForLogin.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16)
        let trailingAnchor = self.inputBlockForLogin.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16)
        let heightAnchor = self.inputBlockForLogin.heightAnchor.constraint(equalToConstant: 50)
        
        return [
            topContraint, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    private func InputBlockForPasswordHeaderView() -> [NSLayoutConstraint]{
        let topContraint = self.inputBlockForPassword.topAnchor.constraint(equalTo: self.inputBlockForLogin.bottomAnchor, constant: 0)
        let leadingAnchor = self.inputBlockForPassword.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16)
        let trailingAnchor = self.inputBlockForPassword.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16)
        let heightAnchor = self.inputBlockForPassword.heightAnchor.constraint(equalToConstant: 50)
        
        return [
            topContraint, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    private func editButtonView() -> [NSLayoutConstraint]{
        let topContraint = self.editButton.topAnchor.constraint(equalTo: self.inputBlockForPassword.bottomAnchor, constant: 16)
        let leadingAnchor = self.editButton.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 16)
        let trailingAnchor = self.editButton.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -16)
        let heightAnchor = self.editButton.heightAnchor.constraint(equalToConstant: 50)
        
        return [
            topContraint, leadingAnchor, trailingAnchor, heightAnchor
        ]
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

