import UIKit

class PostViewController: UIViewController {
    var titlePost: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemIndigo
        self.navigationItem.title = titlePost
        let barButtonAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(redColor))
    
        navigationItem.rightBarButtonItem = barButtonAdd
    }
    
    @objc private func didTapButton(){
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redColor(){
        let vc = InfoViewController()
        //vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true)
    }
    
}
