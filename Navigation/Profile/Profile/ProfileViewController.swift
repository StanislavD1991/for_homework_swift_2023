import UIKit

class ProfileViewController: UIViewController {
    // MARK: - properties
    
    private var posts: [Post] = arrayPosts
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = 0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfilePostCell.self, forCellReuseIdentifier: "ProfilePostCellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultPostCellID")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - properties

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        addConstraints()
    }

    // MARK: - Functions
    
    private func addView() {
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}

    // MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ProfilePostCellID", for: indexPath) as? ProfilePostCell else {
            return UITableViewCell()
        }
        cell.setup(post: self.posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(headerTapped)))
            return headerView
        }
        return nil
    }
    
    @objc func headerTapped() {
        let vc = PhotosViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - UITableViewDelegate
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }   

}

