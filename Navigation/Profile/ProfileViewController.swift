import UIKit //LogInViewController

class ProfileViewController: UIViewController {
    
    private lazy var newButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .systemGreen
        button.setTitle("кнопка", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = Navigation.ProfileHeaderView(frame: .zero)
        profileHeaderView.backgroundColor = .systemGray
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Страница профиля"
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(self.newButton)
       // let profileViewContraints = ProfileHeaderView()
        
        //активация констрейна
        //NSLayoutConstraint.activate(profileViewContraints)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.newButton.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: 40),
            self.newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Скрыть кнопку "Back" на Navigation Bar
        self.navigationItem.hidesBackButton = true
    }
    
    /*
    private func ProfileHeaderView() -> [NSLayoutConstraint]{
        let topContraint = NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let leftContraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightContraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightAnchor = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        return [
            topContraint, leftContraint, rightContraint, heightAnchor
        ]
    }
     */
    
    /*
    private func setupView() {
        //self.backgroundColor = .systemBackground
        self.addSubview(self.newButton)
                
        NSLayoutConstraint.activate([
            self.newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 150),
            self.newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    */
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
