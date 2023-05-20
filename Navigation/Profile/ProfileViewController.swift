import UIKit

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
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.newButton.heightAnchor.constraint(equalToConstant: 50),
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Скрыть кнопку "Back" на Navigation Bar
        self.navigationItem.hidesBackButton = true
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
