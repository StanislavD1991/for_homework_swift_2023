import UIKit

class ProfileViewController: UIViewController {
    // Массив с данными для ленты постов
    var posts: [Post] = [
        Post(
            author: "Приписывается примарху Сангвинию, «Сборник Рассвета»",
            description: "Монета, которой мы расплачиваемся за наше золотое будущее — это смерть, смерть наших врагов, убитых в бою, и наших собственных людей, принесённых в жертву на алтаре прогресса. Каждая смерть — камень, что ложится на мою душу, рана, которую мой легион носит с гордостью, и наше бремя возвестит золотой век, который предвидел Император",
            image: "Sanguinius.png",
            likes: 1982,
            views: 2344
            ),
        Post(
            author: "Рогал Дорн, примарх Имперских Кулаков",
            description: "Сомнение — величайшая слабость. Оно может разрушить самую крепкую стену без единого выстрела и свалить самого могучего чемпиона, прежде чем он выхватит меч",
            image: "RogalDorn.png",
            likes: 3242,
            views: 4322
            ),
        Post(
            author: "Примарх Вулкан",
            description: "Наша задача — защитить человечество и сохранить человечность",
            image: "Vulkan.png",
            likes: 1231,
            views: 1302
            ),
        Post(
            author: "Крис Райт «Волчий Король»",
            description: "Русс стал большим фенрисийцем, чем они сами. Он пил мёд с берсерками и боролся с черногривыми на кровавом снегу, презрительно и весело хохотал в море звезд. Он позволил годи украшать доспех и гравировать мечи. Он избегал советов Жиллимана и Льва, и игнорировал каждого эмиссара Лоргара. Он делал именно то, что ему говорил Всеотец — стал оружием последнего выбора, самым верным из братьев, исполнителем грязных войн.",
            image: "LemanRuss.png",
            likes: 3213,
            views: 4322
            )
    ]
    
    let tableView = UITableView.init(frame: .zero) //, style: .grouped?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //Этот код устанавливает свойство prefersLargeTitles для навигационного бара, который связан с текущим контроллером. Если это свойство установлено в true, то заголовок на навигационном баре будет отображаться в большом размере.
        //Это свойство доступно только в iOS 11 и выше.
        
        //self.navigationItem.title = "Table"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        //self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    //Эта функция переопределяет метод viewWillTransition в UIViewController и вызывает метод updateLayout с переданным размером size. Метод updateLayout обновляет размер таблицы (tableView) и устанавливает его равным переданному размеру (size), начиная с точки (0,0). Кроме того, функция использует объект coordinator для выполнения анимации изменения размеров экрана, чтобы пользователь мог видеть плавный переход между различными размерами.
    //Это полезно при изменении размеров экрана или при переключении между различными ориентациями экрана.
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    //Эта функция обновляет размер таблицы (tableView) и устанавливает его равным переданному размеру (size), начиная с точки (0,0).
    //Это может быть полезно при изменении размеров экрана или при переключении между различными ориентациями экрана.
    
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    //Эта функция возвращает количество строк в таблице.
    //В зависимости от того, какая таблица вызвала функцию, она возвращает количество элементов в массиве "posts" для основной таблицы или 0 для любой другой таблицы.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       switch tableView {
       case self.tableView:
          return self.posts.count
        default:
          return 0
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
                
        cell.largeContentTitle = self.posts[indexPath.row].author
        cell.imageView?.image = UIImage(named: self.posts[indexPath.row].image)
        cell.textLabel?.text = "\(self.posts[indexPath.row].description)\nlikes: \(self.posts[indexPath.row].likes) views: \(self.posts[indexPath.row].views)"
        
        
        //отвечает за добавление стрелочки (accessoryType) к первой ячейке таблицы, чтобы указать на возможность перехода на другой экран при ее нажатии.
//       if indexPath.row == 0 {
//          cell.accessoryType = .disclosureIndicator
//       }
       return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return UITableView.automaticDimension
    }    
}

class TableViewCell: UITableViewCell {

    //prepareForReuse() - это метод, вызываемый у ячейки таблицы, когда она готовится к повторному использованию. Он позволяет сбросить все значения и настройки ячейки до начального состояния, чтобы избежать ошибок и непредвиденного поведения при повторном использовании ячеек в таблице. В этом методе можно освободить ресурсы, сбросить текст и изображения, отменить выбор ячейки и т.д.
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //self.accessoryType = .none устанавливает тип аксессуара ячейки в "нет", что означает отсутствие дополнительных элементов в правой части ячейки (например, стрелки, значки и т.д.). Это может быть полезно при повторном использовании ячейки, чтобы избежать непредвиденного поведения, связанного с наличием аксессуара в ячейке.
        
        self.accessoryType = .none
    }
}




//import UIKit
//
//class ProfileViewController: UIViewController {
//
//    private lazy var newButton: UIButton = {
//        let button = UIButton(frame: .zero)
//        button.backgroundColor = .systemGreen
//        button.setTitle("кнопка", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
//
//    private lazy var profileHeaderView: ProfileHeaderView = {
//        let profileHeaderView = Navigation.ProfileHeaderView(frame: .zero)
//        profileHeaderView.backgroundColor = .systemGray
//
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//
//        return profileHeaderView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .lightGray
//        self.title = "Страница профиля"
//        self.view.addSubview(self.profileHeaderView)
//        self.view.addSubview(self.newButton)
//
//        NSLayoutConstraint.activate([
//            NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
//            self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
//
//            self.newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
//            self.newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
//            self.newButton.heightAnchor.constraint(equalToConstant: 50),
//            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        // Скрыть кнопку "Back" на Navigation Bar
//        self.navigationItem.hidesBackButton = true
//    }
//
//    @objc private func didTapButton(){
//        let vc = PostViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//
//}
