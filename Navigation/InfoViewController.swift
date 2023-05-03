import UIKit

class InfoViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setImage(UIImage(systemName: "alert"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapClosedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(self.closeButton)
        self.closeButton.center = self.view.center
    }
    
    @objc private func didTapClosedButton(){
        let alertController = UIAlertController(title: "question", message: "Are u ok?", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Yes, ok", style: .default) {_ in print("Ok")}
        let secondAction = UIAlertAction(title: "NO, ok", style: .default) {_ in print("hah, ok")}
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
}
