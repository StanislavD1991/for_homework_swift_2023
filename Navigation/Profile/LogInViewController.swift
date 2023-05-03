import UIKit

// Домашнее задание "UITableView, UIScrollView, datasource и delegate" часть 1
// Уважаемый преподаватель, к сожалению у меня не получилось сделать задание на 100% - не могу понять, как связать UIScrollView с контентом
// Подскажите пожалуйста, как нужно настроить, чтобы контент (который я отрисовал) отобразился в UIScrollView (для этого нужно мою верстку положить в UIView а его уже в UIScrollView?)
//P.S. У меня был большой перерыв в обучении (полгода), не все смог вспомнить из пройденного - буду благодарен обратной связи

class LogInViewController: UIViewController {
    
    private lazy var MyScrollView: UIScrollView = {
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
        input.textColor = .black
        input.font = UIFont.systemFont(ofSize: 16.0)
        input.font = UIFont.boldSystemFont(ofSize: 10)
        input.placeholder = "Password"
        input.autocapitalizationType = .none
        input.isSecureTextEntry = true
        input.layer.borderColor = UIColor.lightGray.cgColor
        input.layer.borderWidth = 0.5
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
        
        self.view.addSubview(self.MyScrollView)
        self.view.addSubview(self.contentView)
        
        let logoImageHeaderView = LogoImageHeaderView()
        let inputBlockForLoginHeaderView = InputBlockForLoginHeaderView()
        let inputBlockForPasswordHeaderView = InputBlockForPasswordHeaderView()
        let editButtonView = editButtonView()
        let myStackView = myStackView()
        //let myScrollView = myScrollView()
        //let myContentView = myContentView()
        
        self.MyStackView.center = self.view.center
        self.MyStackView.addArrangedSubview(self.inputBlockForLogin)
        self.MyStackView.addArrangedSubview(self.inputBlockForPassword)
        
        //contentView.addSubview(MyStackView)
        //self.MyScrollView.addSubview(self.contentView)

        
        //активация констрейна
        NSLayoutConstraint.activate(logoImageHeaderView)
        NSLayoutConstraint.activate(myStackView)
        NSLayoutConstraint.activate(inputBlockForLoginHeaderView)
        NSLayoutConstraint.activate(inputBlockForPasswordHeaderView)
        NSLayoutConstraint.activate(editButtonView)
        //NSLayoutConstraint.activate(myScrollView)
    }
    /*
    private func myContentView() -> [NSLayoutConstraint]{
        let topContraint = self.LogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        let heightAnchor = self.LogoImageView.heightAnchor.constraint(equalToConstant: 100)
        let centerXAnchor = self.LogoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor)
        
        return [
            topContraint, heightAnchor, centerXAnchor
        ]
    }
    
    private func myScrollView() -> [NSLayoutConstraint]{
        let topContraint = self.LogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        let heightAnchor = self.LogoImageView.heightAnchor.constraint(equalToConstant: 100)
        let centerXAnchor = self.LogoImageView.centerXAnchor.constraint(equalTo: super.view.centerXAnchor)
        
        return [
            topContraint, heightAnchor, centerXAnchor
        ]
    }
    */
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
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        MyScrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        MyScrollView.contentInset.bottom = 0.0
    }
}

