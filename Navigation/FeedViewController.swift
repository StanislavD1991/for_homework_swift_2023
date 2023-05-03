import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост для передачи")
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 57, y: 410, width: 217.5, height: 77.5))
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width: 200, height: 50))
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
        self.view.addSubview(self.stackView)
        self.stackView.center = self.view.center
        self.stackView.addArrangedSubview(self.button)
        self.stackView.addArrangedSubview(self.button2)
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        vc.titlePost = post.title
        self.navigationController?.pushViewController(vc, animated: true)        
    }
}
